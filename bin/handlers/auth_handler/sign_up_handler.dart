import 'package:shelf/shelf.dart';
import 'dart:convert';
import 'package:supabase/supabase.dart';
import '../../config/supabase.dart';
import '../../logic/check_body.dart';
import '../../response/auth_response.dart';

userSignUpHandler(Request req) async {
  try {
    final keys = ['name', 'email', 'password'];

    final Map<String, dynamic> body = jsonDecode(await req.readAsString());

    checkBody(body: body, keys: keys);

    final SupabaseClient client = SupaBaseIntegration.subaInstance;
    final String name = body['name'];
    final String email = body['email'];
    final String password = body['password'];

    late AuthResponse user;

    await client.auth.admin
        .createUser(AdminUserAttributes(email: email, password: password, emailConfirm: true))
        .then((value) async {
      try {
        //login to user acc to get user token
        user = await client.auth.signInWithPassword(email: email, password: password);
        body.remove('password');
        body.addAll({'user_id': user.user!.id, 'email': email});
        //add user to [users] table
        await client.from('users').insert(body);

        await client.from('about').insert({'user_id': user.user!.id, 'email': email, "name": name});
        // await client.from('education').insert({'user_id': user.user!.id});
        // await client.from('skills').insert({'user_id': user.user!.id});
        // await client.from('projects').insert({'user_id': user.user!.id});
        // await client.from('social').insert({'user_id': user.user!.id});
      } catch (err) {
        return Response.badRequest(body: err);
      }
    });

    return authResponse(user: user, message: "Account Created Successfully");
  } on AuthException catch (err) {
    return Response.badRequest(body: err.toString());
  } catch (err) {
    return Response.badRequest(body: err.toString());
  }
}
