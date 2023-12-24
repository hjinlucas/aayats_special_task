import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/exports.dart';
import '../../global.dart';
import '../../models/request/chat/create_chat.dart';
import '../../models/response/chat/get_chat.dart';
import '../../models/response/chat/initial_msg.dart';
import '../config.dart';

class ChatHelper {
  static var client = https.Client();

  // Start chatting
  // static Future<List<dynamic>> apply(CreateChat model) async {

  // }

  // static Future<List<GetChats>> getConversations() async {
  //   String? token = await Global.storageService
  //       .getString(Constants.STOGRAGE_USER_TOKEN_KEY);
  // }
}
