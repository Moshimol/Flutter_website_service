import 'dart:convert';
import 'data.dart';

import 'dart:io';

main() async {
  var responService = await HttpServer.bind('192.168.1.7', 8080);
  
  
  await for (HttpRequest request in responService) {
    handleMessage(request);
  }
}


void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      hadleGet(request);
    } else {
      hadlePOST(request);
    }
  } catch (e) {
  }
}

void hadleGet(HttpRequest request) {
  var action = request.uri.queryParameters['action'];

  if (action == 'get_products') {
    var page = request.uri.queryParameters['page'];

    print(page);

    request.response..statusCode = HttpStatus.ok..write(json.encode(products))..close();
  } else if (action == 'get_news') {
    request.response..statusCode = HttpStatus.ok..write(json.encode(news))..close();
  } else if (action == "company") {
    var msg = request.uri.queryParameters['msg'];
    print("客户留言为 $msg");
    request.response..statusCode = HttpStatus.ok..write('客户留言为 $msg')..close();
  }

}

void hadlePOST(HttpRequest request) {
  // 个人反馈


}