part of '../chat_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'Admin Treshop',
      ),
      body: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _BodySection(
                scrollController: _scrollController,
                chatList: MessageList.conversationList,
              ),
            ),
            _BuildChatTextBox(
              textController: _textController,
              onUploadFileTap: () {},
              onSendTap: () {
                if (_textController.text == '') {
                  // showToast(
                  //     msg: AppLocalizations.of(context)!
                  //         .cannot_send_empty_message);
                  return;
                }
                final message = ChatModel(
                  sendTime: DateTime.now(),
                  isRead: true,
                  message: _textController.text,
                  isByMe: true,
                );
                sendMessageToBarber(message);
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendMessageToBarber(ChatModel chat) {
    _textController.clear();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      ),
    );
  }
}
