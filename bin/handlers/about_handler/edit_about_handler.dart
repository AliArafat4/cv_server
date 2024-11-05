import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../config/supabase.dart';
import '../../logic/check_body.dart';

editAboutHandler(Request req) async {
  try {
    final Map<String, dynamic> body = jsonDecode(await req.readAsString());
    checkBody(keys: ['name', 'title_position', 'phone', 'location', 'birthday', 'bio'], body: body);

    //Get user object
    final UserResponse user =
        await SupaBaseIntegration().getUserByToken(token: req.headers['token']!);

    //update user profile in [profile] table
    SupaBaseIntegration().updateTable(tableName: 'about', body: body, user: user);

    return Response.ok("Profile Updated Successfully ");
  } on AuthException catch (err) {
    return Response.badRequest(body: err.message);
  } catch (err) {
    return Response.badRequest(body: err.toString());
  }
}
