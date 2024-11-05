import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../config/supabase.dart';
import '../../logic/check_body.dart';
import '../../response/ok_response.dart';

getSkillHandler(Request req) async {
  try {
    final UserResponse user =
        await SupaBaseIntegration().getUserByToken(token: req.headers['token']!);

    final res = await SupaBaseIntegration()
        .getFromTable(tableName: 'skills', user: user, columnCondition: 'user_id');

    return okayResponse(res: res);
  } on AuthException catch (err) {
    return Response.badRequest(body: err.message);
  } catch (err) {
    return Response.badRequest(body: err.toString());
  }
}
