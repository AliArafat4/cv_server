import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../config/supabase.dart';
import '../../logic/check_body.dart';

addProjectHandler(Request req) async {
  try {
    final Map<String, dynamic> body = jsonDecode(await req.readAsString());
    checkBody(keys: ['name', 'description', 'state'], body: body);

    final UserResponse user =
        await SupaBaseIntegration().getUserByToken(token: req.headers['token']!);

    body.addAll({'user_id': user.user!.id});

    await SupaBaseIntegration().insertToTable(tableName: 'projects', body: body);

    return Response.ok("project has been added successfully");
  } on FormatException catch (err) {
    if (err.message == "Unexpected end of input") {
      return Response.badRequest(body: "Body cannot be empty");
    } else {
      return Response.badRequest(body: err.message);
    }
  } on PostgrestException catch (err) {
    return Response.badRequest(body: err.message);
  } catch (err) {
    return Response.badRequest(body: err.toString());
  }
}
