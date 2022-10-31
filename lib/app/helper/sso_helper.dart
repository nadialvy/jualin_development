// import 'dart:async';
// import 'dart:io';

// import 'package:flutter_config/flutter_config.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:gredu_common/gredu_common.dart';
// import 'package:oauth2_client/google_oauth2_client.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// mixin SSOHelper {
//   // oauth2
//   static final appId = '${FlutterConfig.get('APP_ID')}${FlutterConfig.get('APP_SUFFIX_ID')}';
//   static final clientId = Platform.isIOS ? '${FlutterConfig.get('SSO_GOOGLE_CLIENT_ID_IOS')}' : '${FlutterConfig.get('SSO_GOOGLE_CLIENT_ID_ANDROID')}';
//   static final scopes = [
//     'profile',
//     'email',
//     'https://www.googleapis.com/auth/drive',
//     'https://www.googleapis.com/auth/drive.appdata',
//     'https://www.googleapis.com/auth/drive.file',
//     // 'https://www.googleapis.com/auth/drive.metadata',
//   ];

//   // google
//   static GoogleSignInAccount? _googleSignInAccount;
//   static final _googleSignIn = GoogleSignIn(scopes: scopes);

//   // —————————————————————————————————————————————————————————————————————————————

//   // OAUTH_2_GOOGLE
//   static Future<void> oAuth2Google(Function(String) callback) async {
//     final client = GoogleOAuth2Client(customUriScheme: appId, redirectUri: '$appId:/oauth2redirect');
//     await client.requestAuthorization(clientId: clientId, scopes: scopes).then((auth) async {
//       if (auth.code != null) {
//         logW(auth.code);
//         callback.call(auth.code ?? '');
//       }
//     }).catchError((error, stack) {
//       logW('$error');
//     });
//   }

//   @Deprecated('[geng, please ganti ke `oAuth2Google`]')
//   static Future<GoogleSignInAccount?> signInWithGoogle() async {
//     try {
//       await _googleSignIn.signIn().then((account) {
//         if (account?.id != null) {
//           logI('—————————————————————————————————————————————————————————————————————————————');
//           logI('token : ${account?.id}');
//           logI('email : ${account?.email}');
//           logI('displayName : ${account?.displayName}');
//           logI('photoUrl : ${account?.photoUrl}');
//           logI('serverAuthCode : ${account?.serverAuthCode}');
//           logI('—————————————————————————————————————————————————————————————————————————————');
//           _googleSignInAccount = account;
//         } else {
//           return null;
//         }
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//     return _googleSignInAccount;
//   }

//   static Future<AuthorizationCredentialAppleID?> signInWithApple() async {
//     logD('START APPLE HERE.....');

//     final credential = await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//       webAuthenticationOptions: WebAuthenticationOptions(
//         clientId: FlutterConfig.get('SSO_APPLE_CLIENT_ID'),
//         redirectUri: Uri.parse(FlutterConfig.get('SSO_APPLE_REDIRECT_URI')),
//       ),
//       nonce: 'nonce',
//       state: 'state',
//     );

//     logD('CREDENTIAL APPLE : ${credential.state}');

//     print(credential);

//     try {
//       if (credential != null) {
//         final authCode = credential.authorizationCode;
//         final token = credential.identityToken ?? '-';
//         final givenName = credential.givenName ?? '-';
//         final familyName = credential.familyName ?? '-';
//         final userIdentifier = credential.userIdentifier ?? '-';
//         final email = credential.email ?? '-';

//         logI('—————————————————————————————————————————————————————————————————————————————');
//         logI('authCode $authCode');
//         logI('token $token');
//         logI('—————————————————————————————————————————————————————————————————————————————');
//         logI('userIdentifier $userIdentifier');
//         logI('givenName $givenName');
//         logI('familyName $familyName');
//         logI('email $email');
//         logI('—————————————————————————————————————————————————————————————————————————————');

//         return credential;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   // GOOGLE SSO HELPER
//   static String getGoogleAccountEmail() => _googleSignInAccount?.email ?? '-';

//   static String getGoogleAccountDisplayName() => _googleSignInAccount?.displayName ?? '-';

//   static String getGoogleAccountPhotoUrl() => _googleSignInAccount?.photoUrl ?? '-';

//   // LOGOUT
//   static Future<void> googleLogout({Function? onLogoutSuccess}) async {
//     await _googleSignIn.signOut().then((_) => onLogoutSuccess?.call());
//   }
// }
