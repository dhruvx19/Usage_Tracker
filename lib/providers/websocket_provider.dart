import 'dart:convert';
import 'package:assignment/constants/endpoint.dart';
import 'package:assignment/models/ws_model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


//provider for the websocket
class WebSocketProvider with ChangeNotifier {
  UsageModel? _usageModel;
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse(winServiceUrl), // WebSocket endpoint URL
  );

  UsageModel? get usageModel => _usageModel;

  UsageProvider() {
    _channel.stream.listen(
      (data) {
        try {
          final jsonData = json.decode(data);
          _usageModel = UsageModel.fromJson(jsonData);
          notifyListeners();
          print('Data received and parsed: $_usageModel');
        } catch (e, stacktrace) {
          print('Error parsing data: $e');
          print(stacktrace);
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
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
