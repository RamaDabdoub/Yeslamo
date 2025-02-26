import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = 'fakestoreapi.com';
  // static String baseUrl = 'fakestoreapi.com';

  // static String baseUrl = 'jsonplaceholder.typicode.com';

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String route,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    var url = Uri.https(baseUrl, route, params);
    http.Response response;

    switch (type) {
      case RequestType.get:
        response = await http.get(url, headers: headers);
        break;
      case RequestType.post:
        response = await http.post(url, body: (body), headers: headers);
        break;
      case RequestType.delete:
        response = await http.delete(url, body: (body), headers: headers);
        break;
      case RequestType.put:
        response = await http.put(url, body: (body), headers: headers);
        break;
    }
    if (response.statusCode == 401) {
      //AnAUTH
      // Get.to(LoginView()); // عمل لوغ ان جديد واخد التوكين
      return; //وقف التنفيذ
    }

    Map<String, dynamic> jsonResponse = {};
    dynamic result;
    String decodedBody = const Utf8Codec().decode(response.bodyBytes);

    try {
      result = jsonDecode(decodedBody);
    } catch (e) {}

    jsonResponse.putIfAbsent(
        'response', () => result ?? {'message': decodedBody});

    jsonResponse.putIfAbsent('statusCode', () => response.statusCode);

    return jsonResponse;
  }

  static Future<dynamic> sendMultipartRequest({
    required String route,
    required RequestType type,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, String>? fields, //!Text,
    Map<String, String>? files, //*File,
//!{ "image_cover":"C://user/image.png" , "image_profile":"C://user/image.png"}
  }) async {
    try {
      var request = http.MultipartRequest(
           type.toString().split('.').last, Uri.https(baseUrl, route, params));

      var filesKeyList = files!.keys.toList();
      var filesNameList = files.values.toList();

      for (int i = 0; i < filesNameList.length; i++) {
        if (filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            //لح يجهز المسار لحتى يقدر يعملو ابلود عالسيرفر
            filesKeyList[i], //! image_profile
            filesNameList[i], //* File path
            filename: path.basename(filesNameList[i]),
            contentType: getContentType(filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }
      //هون حقق جزئية اضافة الفايل على الريكويست

      //? C://user/images/user.png
      //* path.basename(C://user/images/user.png) => user.png

      // هلا بدي ضيف الفيلدز للريكويست

      request.fields.addAll(fields!); //? (Text type) first_name => Hazem
      request.headers.addAll(headers!);
      var response = await request.send();
      var value = await response.stream.bytesToString();
      // النتيجة الراجعة نجاح او فشل لرفع الفايل

      Map<String, dynamic> responseJson = {};
      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      BotToast.showText(text: error.toString());
    }
  }

  static MediaType getContentType(String name) {
    //!=> user.png
    //!=> user.png.split('.')  ["user","png"]
    //!=> ["user","png"].last => Png

    var ext = name.split('.').last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }
}
