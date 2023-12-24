import '../../../models/response/chat/get_chat.dart';

/*
   This file will define the state of chat. 
   This state will include all necessary data for chat UI, such as a list of messages, loading status, error messages, etc.
 */

class ChatState {
  final List<GetChats> chats;
  final List<String> online;
  final bool typing;
  final String? userId;
  final List<String> onlineUsers;
  final bool isLoading;
  final String? errorMessage;

  ChatState({
    this.chats = const [],
    this.online = const [],
    this.typing = false,
    this.userId,
    this.onlineUsers = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  ChatState copyWith({
    List<GetChats>? chats,
    List<String>? online,
    bool? typing,
    String? userId,
    List<String>? onlineUsers,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      online: online ?? this.online,
      typing: typing ?? this.typing,
      userId: userId ?? this.userId,
      onlineUsers: onlineUsers ?? this.onlineUsers,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
