import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry/interceptor/dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(_shouldRetry(err)){
      try{
        return handler.resolve(await requestRetrier.scheduleRequestRetry(err.requestOptions));
      }catch(e){
        return handler.next(err);
      }
    }
    return handler.next(err);

  }

  bool _shouldRetry(DioException err){
    return err.error != null
      && err.error is SocketException;
  }
}