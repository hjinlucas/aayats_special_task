import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/request/messaging/send_message.dart';
import '../../models/response/messaging/messaging_res.dart';
import '../config.dart';

class MessagingHelper {
  static var client = https.Client();

  // Start chatting
  // static Future<List<dynamic>> sendMessage(SendMessage model) async {

  // }

  // static Future<List<ReceivedMessage>> getMessages(
  //     String chatId, int offset) async {

  // }
}
