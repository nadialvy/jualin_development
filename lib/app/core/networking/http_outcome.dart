///   created               : Aditya Pratama
///   originalFilename      : outcome
///   date                  : 11 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   CENTRALIZE OUTCOME RESPONSE FROM API .
///   benefit
///   1. bikin decoupling si service http, in case kalo mau ganti provider / lib lain,
///      hanya perlu rombak 1 file doang .
///   2. in case response api nya bukan bentuk json atau error aneh2, masih bisa dihandle
///      karna di tampung di object generic <T> .
///
///
part of 'http.dart';

class Outcome<T> {
  Outcome({
    this.isFailure = false,
    this.errorMessages,
    this.errorBody,
  });

  bool isFailure;
  dynamic statusCode;
  dynamic errorMessages;
  dynamic errorBody;
  T? body;
}
