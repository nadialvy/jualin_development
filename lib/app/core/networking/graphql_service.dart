// import 'dart:convert';

// import 'package:flutter_config/flutter_config.dart';
// import 'package:get/get.dart';
// import 'package:graphql/client.dart';
// import 'package:gredu_belajar/app/core/networking/http.dart';
// import 'package:gredu_common/gredu_common.dart';
// import 'package:jwt_decode/jwt_decode.dart';

// import '../../helper/pref_helper.dart';

// class GraphQLService {
//   GraphQLService({required this.endPoint}) {
//     _authLink = AuthLink(getToken: () => _getAuthToken());
//     _httpLink = HttpLink(
//       '${FlutterConfig.get('BASE_URL')}$endPoint',
//     );
//     _link = _authLink.concat(_httpLink);
//   }

//   final String endPoint;

//   final apiService = Get.find<HttpService>();

//   late final Link _link;

//   late final HttpLink _httpLink;

//   late final AuthLink _authLink;

//   Future<String?> _getAuthToken() async {
//     String? token;
//     final bool isExpired;
//     if (PrefHelper.userToken != null) {
//       final expiredDate = Jwt.getExpiryDate(PrefHelper.userToken!);
//       if (expiredDate != null) {
//         isExpired = expiredDate.millisecondsSinceEpoch < DateTime.now().millisecondsSinceEpoch;
//       } else {
//         isExpired = true;
//       }
//     } else {
//       isExpired = true;
//     }
//     if (isExpired == true) {
//       await _reNewToken()
//           .then(
//         (value) => {token = 'Bearer $value'},
//       )
//           .catchError((e) {
//         token = null;
//       });
//     } else {
//       token = 'Bearer ${PrefHelper.userToken}';
//     }
//     return token;
//   }

//   Future<String> _reNewToken() async {
//     final response = await apiService.httpPost(
//       endPoint: '/user/v1.0/renew-token',
//       body: {
//         'refresh_token': '${PrefHelper.userRefreshToken}',
//       },
//     );
//     final token = response.body['data']['access_token'];
//     final rToken = response.body['data']['refresh_token'];
//     final gToken = response.body['data']['google_token'];

//     await PrefHelper.setUserToken(token);
//     await PrefHelper.setUserRefreshToken(rToken);
//     await PrefHelper.setUserGoogleToken(gToken);

//     return token;
//   }

//   GraphQLClient _getClient() {
//     return GraphQLClient(
//       defaultPolicies: DefaultPolicies(query: Policies(fetch: FetchPolicy.noCache)),
//       cache: GraphQLCache(),
//       link: _link,
//     );
//   }

//   Future<Outcome> executeQuery({required String query, Map<String, dynamic>? variables}) async {
//     //await checkTokenExpiryAndReinitializeLink();
//     final result = Outcome();
//     final queryOption = variables == null ? QueryOptions(document: gql(query)) : QueryOptions(document: gql(query), variables: variables);
//     GraphQLLogger.print(name: 'Link : ', message: '${_httpLink.uri}');
//     GraphQLLogger.print(name: 'Headers : ', message: '${_httpLink.defaultHeaders}');
//     GraphQLLogger.print(name: 'Executing query...', message: '$query');
//     GraphQLLogger.print(name: 'Executing with variables...', message: '$variables');
//     final request = await _getClient().query(queryOption);
//     if (request.hasException) {
//       GraphQLLogger.printError(name: 'Error', message: '${request.exception}');
//       throw Exception(request.exception);
//     }
//     GraphQLLogger.print(name: 'Success', message: '${jsonEncode(request.data)}');
//     result.body = request.data;
//     result.isFailure = false;
//     return result;
//   }

//   Future<Outcome> mutate({required String mutation, Map<String, dynamic>? variables}) async {
//     final result = Outcome();
//     final MutationOptions<Object?> mutationOption;
//     if (variables == null) {
//       mutationOption = MutationOptions(document: gql(mutation));
//     } else {
//       mutationOption = MutationOptions(document: gql(mutation), variables: variables);
//     }
//     GraphQLLogger.print(name: 'Link : ', message: '${_httpLink.uri}');
//     GraphQLLogger.print(name: 'Headers : ', message: '${_httpLink.defaultHeaders}');
//     GraphQLLogger.print(name: 'Executing mutation...', message: '$mutation');
//     GraphQLLogger.print(name: 'Executing with variables...', message: '$variables');
//     final request = await _getClient().mutate(mutationOption);
//     if (request.hasException) {
//       GraphQLLogger.printError(name: 'Error', message: '${request.exception}');
//       throw Exception(request.exception);
//     }
//     GraphQLLogger.print(name: 'Success', message: '${jsonEncode(request.data)}');
//     result.body = request.data;
//     result.isFailure = false;
//     return result;
//   }
// }

// mixin GraphQLLogger {
//   static void print({required String name, String? message}) {
//     logD('GraphQL ---> $name : $message');
//   }

//   static void printError({required String name, String? message}) {
//     logE('GraphQL ---> $name : $message');
//   }
// }
