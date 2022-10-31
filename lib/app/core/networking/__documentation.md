# Features
- axios code style    -> [await->then->catchError]
- http                -> get, post, put, delete, upload, download
- http_interceptor    -> ability modify interceptor
- http_modifier       -> ability modify res, req
- refresh_token       -> ability modify auth
- http_log            -> show http log
- outcome             -> google sealed class technique (centralize)
- socket              -> ability to handle websocket
- auto fix http issue on low SDK android
- auto fix certificate issue on android
## Use example:

```dart

/// inject APIService on `main.dart`
void main() {
  ...
    Get.put<ApiService>(ApiService(
      baseURL: FlutterConfig.get('BASE_URL').toString(),
      baseHeader: {
        'App-ID': '123',
        'Device-ID': await DeviceInfo().uuid(),
        'Device-Type': Platform.operatingSystem,
        'Authorization': 'Bearer ${PrefHelper.userToken}',
      },
    )); // sample using GetX
  ...
}



/// put on provider
class ExampleProvider extends BaseProvider {
  
  // example with baseURL
  getTodayQoute() async {
    return apiService.httpGet(
      endpoint: '/user',
      header: {},
      query: {},
      withToken: true,
    );
  }

  // example plain url
  getTodayQoute() async {
    return apiService.http(
      url: 'https://zenquotes.io/api/today',
      method: Method.GET,
    );
  }
}

/// put on controller
class ExampleController extends BaseController<HomeProvider> {
  
  loadAPI() async {
    await provider.getTodayQoute().then((response) {
      print(response.body);
    }).catchError((e) {
      print(e);
    });
  }
}


```