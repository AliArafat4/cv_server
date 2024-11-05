import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../config/supabase.dart';
import '../../logic/check_body.dart';

deleteSkillHandler(Request req) async {
  try {
    final Map<String, dynamic> body = jsonDecode(await req.readAsString());
    checkBody(keys: ['id'], body: body);

    // final UserResponse user =
    //     await SupaBaseIntegration().getUserByToken(token: req.headers['token']!);

    await SupaBaseIntegration()
        .deleteFromTable(tableName: 'skills', columnCondition: 'id', condition: body['id']);

    return Response.ok("entry deleted Successfully");
  } on AuthException catch (err) {
    return Response.badRequest(body: err.message);
  } on PostgrestException catch (err) {
    return Response.badRequest(body: err.message);
  } catch (err) {
    return Response.badRequest(body: err.toString());
  }
}
