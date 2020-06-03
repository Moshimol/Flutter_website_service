import 'dart:convert';

import 'dart:io';

main() async {
  var responService = await HttpServer.bind('192.168.2.156', 8080);
  
  
  await for (HttpRequest request in responService) {
    handleMessage(request);
  }

}


void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {

    } else {

    }
  } catch (e) {
  }
}