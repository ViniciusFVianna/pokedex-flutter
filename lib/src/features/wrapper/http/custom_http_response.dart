
import '../log/log_utils.dart';

class CustomHttpResponse {
  final Uri uri;
  final int statusCode;
  final Map<String, dynamic> body;
  final Map<String, String> headers;
  final Map<String, dynamic>? request;

  CustomHttpResponse({
    required this.uri,
    required this.statusCode,
    required this.body,
    required this.headers,
    this.request,
  }) {
    switch (statusCode) {
      case 200:
        successLog(request?['type'] ?? uri.path, tag: "API");
        break;
      default:
        errorLog(
          "${uri.path} - $statusCode",
          data: {
            "request": request?.toString() ?? "",
            "response": body.toString(),
          },
          tag: "API",
        );
    }
  }
}
