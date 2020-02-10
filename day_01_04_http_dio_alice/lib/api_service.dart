import 'dart:convert';
import 'package:day_01_04_http_dio_alice/main.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:alice/alice.dart';

class APIService {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final APIService _singleton = new APIService._internal();
  APIService._internal();

  //This is what's used to retrieve the instance through the app
  static APIService getInstance() => _singleton;

  Dio dio;
  Alice alice;

  // Do anything after initialisation
  void initializeMethod() {
    dio = Dio();
    alice = Alice(
        showNotification: true,
        navigatorKey: navigatorKeyMain,
        showInspectorOnShake: true,
        darkTheme: false);
    dio.interceptors.add(alice.getDioInterceptor());
  }

  // //A clean up method to close
  // //Because this is meant to exist through the entire application life cycle this isn't
  // //really an issue
  // void disposeMethod() {}

  getHttpRequest() async {
    var res = await http.get("https://jsonplaceholder.typicode.com/posts/1");
    alice.onHttpResponse(res);
    var jsonString = jsonDecode(res.body);
    print('getHttpRequest responce =  $jsonString');
  }

  postHttpRequest() async {
    var res = await http.post("https://jsonplaceholder.typicode.com/posts",
        body: {"Name": "HTTP"});
    alice.onHttpResponse(res);
    var jsonString = jsonDecode(res.body);
    print('getHttpRequest responce =  $jsonString');
  }

/*
  Future<http.Response> postRequest () async {
  var url ='https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate';

  Map data = {
    'apikey': '12345678901234567890'
  }
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
*/

  getDioRequest() async {
    //No need to jsonDecode (means no need to import 'dart:convert';)
    var jsonString =
        await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print('getDioRequest responce =  $jsonString');

    //(Type-1) : Type headers in every request
    // var jsonString = await Dio().get(
    //   'https://api.example.com/v1/products/$productId',
    //   queryParameters: {},
    //   options: Options(
    //       contentType: ContentType.json,
    //       responseType: ResponseType.json,
    //       headers: {'Authorization': 'token'}),
    // );

    //(Type-2) : Type headers while initialising dio
    // _dio = Dio();
    // _dio.options.headers= {"Authorization" : token};
    // dio_AnotherWay.interceptor.request.onSend = (Options options) {
    //           options.headers["Authorization"] = token;
    //           return options;
    // };
  }

  postDioRequest() async {
    //No need to jsonDecode (means no need to import 'dart:convert';)
    var jsonString = await dio.post(
        "https://jsonplaceholder.typicode.com/posts",
        data: {"Name": "DIO"});
    print('postDioRequest responce =  $jsonString');
  }
}
