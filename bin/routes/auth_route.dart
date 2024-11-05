import 'package:shelf_router/shelf_router.dart';

import '../handlers/auth_handler/sign_in_handler.dart';
import '../handlers/auth_handler/sign_up_handler.dart';

class AuthRoute {
  Router get route {
    return Router()
      ..post("/sign_up", userSignUpHandler)
      ..post("/sign_in", signInHandler);

    // ..post("/otp", otpHandler)
    // ..post("/resend_otp", resendOtpHandler)
  }
}
