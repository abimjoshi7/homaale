// import 'package:cipher/core/cache/cache_helper.dart';
// import 'package:cipher/core/constants/navigation_constants.dart';
// import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('REQUEST[${options.method}] => PATH: ${options.path} => DATA: ${options.data}');

//     if (options.headers.containsKey('requiresAuthorization')) {
//       options.headers.remove("requiresAuthorization");
//       options.headers.addAll({"Authorization": "Bearer ${CacheHelper.accessToken}"});
//     }

//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {}

//   @override
//   Future onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response != null) {
//       final statusCode = err.response!.statusCode;
//       final requestPath = err.requestOptions.path;
//       final responseData = err.response!.data;

//       print('ERROR[$statusCode] => PATH: $requestPath => MSG: $responseData');

//       if (statusCode! >= 400 && statusCode < 600) {
//         // Handle specific error status codes
//         switch (statusCode) {
//           case 400:
//             if (responseData is Map<String, dynamic> && responseData.containsKey('non_field_errors')) {
//               final nonFieldErrors = responseData['non_field_errors'];
//               if (nonFieldErrors is List<dynamic> && nonFieldErrors.isNotEmpty) {
//                 final errorMessage = nonFieldErrors[0];
//                 print('Non-Field Error: $errorMessage');

//                 //To be implemented
//                 // Navigator.pushNamedAndRemoveUntil(
//                 //   navigationKey.currentContext!,
//                 //   SignInPage.routeName,
//                 //   (route) => false,
//                 // );
//               }
//             }
//             break;
//           case 401:
//             // Handle 401 Unauthorized
//             final response = await dio.post(
//               "user/token/refresh/",
//               data: {
//                 "refresh": token ?? CacheHelper.refreshToken,
//               },
//             );
//             CacheHelper.accessToken = await response.data['access'] as String?;
//             CacheHelper.refreshToken = await response.data['refresh'] as String?;
//             break;
//           case 201:
//             // Handle 201 Created
//             // Your code here
//             break;
//           case 403:
//             // Handle 403 Forbidden
//             // Your code here
//             break;
//           case 500:
//             // Handle 500 Internal Server Error
//             // Your code here
//             break;
//           default:
//             // Handle other error status codes
//             // Your code here
//             break;
//         }
//       } else {}
//     }

//     super.onError(err, handler);
//   }
// }
