import 'package:conduit_app/conduit_app.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://conduit.io/docs/http/channel/.

class ConduitAppChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // the page route
    router.route("/example")
      ..link(ControllerA.new)
      // ControllerB.new is other impression of ()=>ControllerB
      ..link(ControllerB.new)
      // ignore: unnecessary_lambdas
      ..link(() => ControllerC());
    return router;
  }
}

class ControllerA extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    // Handle the request for the "/example" route
    // Return a response or call next controller in the chain
    return request;
  }
}

class ControllerB extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    // Handle the request for the "/example" route
    // Return a response or call next controller in the chain
    return request;
  }
}

class ControllerC extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    // Handle the request for the "/example" route
    // Return a response or call next controller in the chain
    return Response.ok({"last_controller": "C"});
  }
}
