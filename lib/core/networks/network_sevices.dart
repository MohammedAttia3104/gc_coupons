import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<Response> get(String url);
}

class NetworkServicesImpl implements NetworkServices {
  final Dio dio;
  final Map<String, dynamic>? queryParameters;

  NetworkServicesImpl(this.dio, this.queryParameters);

  @override
  Future<Response> get(String url) async {
    return await dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Authorization': 'mp0aSI6ImFhN2Y4ZDBhOTVjIiwic2Nvc',
        },
      ),
    );
  }
}
