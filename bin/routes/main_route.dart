import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_route.dart';
import 'user_route.dart';

class MainRoute {
  Router get route {
    return Router()
      ..get('/', (Request req) => Response.badRequest(body: "Home"))
      ..mount('/auth', AuthRoute().route.call)
      ..mount('/user', UserRoute().route.call)
      // ..mount('/profile', ProfileRoute().route)
      ..all('/<ignored|.*>', (Request req) => Response.badRequest(body: "No EndPoint"));
  }
}
