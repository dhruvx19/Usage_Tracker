import 'dart:convert';
import 'package:assignment/constants/endpoint.dart';
import 'package:assignment/models/ws_model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


//provider to handle the websocket
class WebSocketProvider with ChangeNotifier {
  WebSocketUsageModel? _usageModel;
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse(usageUrl), // WebSocket endpoint URL
  );

  WebSocketUsageModel? get usageModel => _usageModel;

  WebSocketProvider() {
    _channel.stream.listen(
      (data) {
        try {
          final jsonData = json.decode(data);
          _usageModel = WebSocketUsageModel.fromJson(jsonData);
          notifyListeners();
         
        } catch (e, stacktrace) {
          print(stacktrace);
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        //if websocket connection lost
        print('WebSocket connection closed');
      },
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
