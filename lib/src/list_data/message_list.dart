import '../models/chat_model.dart';
import '../models/message_model.dart';

class MessageList {
  static List<MessageModel> messageList = [
    MessageModel(
      isOnline: true,
      createdAt: DateTime.parse('2021-05-01T03:56:27.000000Z'),
      unreadMessage: 3,
      chatList: conversationList,
    ),
    MessageModel(
      isOnline: false,
      unreadMessage: 0,
      createdAt: DateTime.parse('2021-04-08T08:09:14.000000Z'),
      chatList: conversationList,
    ),
    MessageModel(
      isOnline: false,
      createdAt: DateTime.parse('2021-04-14T05:43:33.000000Z'),
      unreadMessage: 0,
      chatList: conversationList,
    ),
    MessageModel(
      isOnline: false,
      createdAt: DateTime.parse('2021-04-10T12:56:06.000000Z'),
      unreadMessage: 0,
      chatList: conversationList,
    ),
    MessageModel(
      isOnline: true,
      createdAt: DateTime.parse('2021-04-10T13:01:25.000000Z'),
      unreadMessage: 0,
      chatList: conversationList,
    ),
    MessageModel(
      isOnline: false,
      createdAt: DateTime.parse('2021-04-12T10:13:42.000000Z'),
      unreadMessage: 0,
      chatList: conversationList,
    ),
  ];

  static List<ChatModel> conversationList = [
    ChatModel(
      isByMe: true,
      message: 'Hey, how are you?',
      isRead: true,
      sendTime: DateTime.parse('2021-04-12T10:10:42.000000Z'),
    ),
    ChatModel(
      isByMe: false,
      message: 'I\'m fine thankyou?',
      isRead: true,
      sendTime: DateTime.parse('2021-04-12T10:15:42.000000Z'),
    ),
    ChatModel(
      isByMe: true,
      message: 'i want coloring my hair!',
      isRead: true,
      sendTime: DateTime.parse('2021-04-12T10:18:42.000000Z'),
    ),
    ChatModel(
      isByMe: true,
      message: 'Can you do your best?',
      isRead: true,
      sendTime: DateTime.parse('2021-04-12T10:21:42.000000Z'),
    ),
    ChatModel(
      isByMe: false,
      message: 'Of course.',
      isRead: true,
      sendTime: DateTime.parse('2021-04-12T10:25:42.000000Z'),
    ),
    ChatModel(
      isByMe: true,
      message: 'Thank you!',
      isRead: false,
      sendTime: DateTime.parse('2021-04-12T10:30:42.000000Z'),
    ),
    ChatModel(
      isByMe: true,
      message: 'I\'m so',
      isRead: false,
      sendTime: DateTime.parse('2021-04-12T10:41:42.000000Z'),
    ),
    ChatModel(
      isByMe: true,
      message: 'Appreciate',
      isRead: false,
      sendTime: DateTime.parse('2021-04-12T10:45:42.000000Z'),
    ),
  ];
}
