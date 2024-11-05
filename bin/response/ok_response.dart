import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

Response okayResponse({required List<Map<String, dynamic>> res}) {
  return Response.ok(
      jsonEncode({
        "msg": "Success",
        "data": res,
        "codeState": 200,
      }),
      headers: {
        "Content-Type": "application/json",
      });
}
