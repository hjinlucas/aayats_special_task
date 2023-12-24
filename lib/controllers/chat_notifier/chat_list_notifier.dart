import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/response/chat/get_chat.dart';

class ChatListNotifier extends StateNotifier<List<GetChats>> {
  ChatListNotifier() : super([]) {}
}

final chatListProvider =
    StateNotifierProvider<ChatListNotifier, List<GetChats>>(
        (ref) => ChatListNotifier());
