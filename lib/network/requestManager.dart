//
//  http.dart
//  fluttertemplet
//
//  Created by shang on 7/26/21 3:57 PM.
//  Copyright © 7/26/21 shang. All rights reserved.
//



import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'fileManager.dart';

class RequestManager{
  RequestManager._internal();

  static final Dio dio = Dio(BaseOptions(
    baseUrl: "https://www.wanandroid.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  static init() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    // var cookieJar = PersistCookieJar(storage: FileStorage(directory.path + "/.cookies/"));
    // final cookieManager = CookieManager(cookieJar);
    // dio.interceptors.add(cookieManager);

    FileManager.getDocumentsDirPath().then((value) => {
        var cookieJar = PersistCookieJar(storage: FileStorage(value + "/.cookies/"));
        dio.interceptors.add(CookieManager(cookieJar));
    });

    dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options, handler) {
      print("请求之前");
      return handler.next(options);
    },
    onResponse: (Response response, handler) {
      print("响应之前");
      return handler.next(response);
    },
    onError: (DioError e, handler) {
      print("错误之前");
      handleError(e);
    return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        print("连接超时");
        break;
      case DioErrorType.sendTimeout:
        print("请求超时");
        break;
      case DioErrorType.receiveTimeout:
        print("响应超时");
        break;
      case DioErrorType.response:
        print("出现异常");
        break;
      case DioErrorType.cancel:
        print("请求取消");
        break;
      default:
        print("未知错误");
        break;
    }



}


  static Future get(String url, [Map<String, dynamic>? params, ProgressCallback? onReceiveProgress]) async {
    Response response = await dio.get(url, queryParameters: params, onReceiveProgress: onReceiveProgress);
    // Response response;
    // if (params != null) {
    //   if (onReceiveProgress != null) {
    //     response = await dio.get(url, queryParameters: params, onReceiveProgress: onReceiveProgress);
    //   } else {
    //     response = await dio.get(url, queryParameters: params);
    //   }
    // } else if (onReceiveProgress != null) {
    //   if (params != null) {
    //     response = await dio.get(url, queryParameters: params, onReceiveProgress: onReceiveProgress);
    //   } else {
    //     response = await dio.get(url, onReceiveProgress: onReceiveProgress);
    //   }
    // } else {
    //   response = await dio.get(url);
    // }
    return response.data;
  }

  ///post body请求(data: FormData)
  static Future post(String url, [data, Map<String, dynamic>? params, ProgressCallback? onReceiveProgress]) async {
    Response response = await dio.post(url, data: data, queryParameters: params, onReceiveProgress: onReceiveProgress);
    return response.data;
  }

  ///下载文件
  static Future download(String urlPath, String savePath, [ProgressCallback? onReceiveProgress]) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath, onReceiveProgress: onReceiveProgress);
      // response = await dio.download(urlPath, savePath, onReceiveProgress: (int count, int total) {
      //   //进度
      //   print("$count $total");
      // });
    } on DioError catch (e) {
      handleError(e);
    }
    return response.data;
  }

}


// class BaseRequestManager extends RequestManager {
//
//
// }
