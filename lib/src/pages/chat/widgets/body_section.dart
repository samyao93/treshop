part of '../chat_page.dart';

class _BodySection extends StatelessWidget {
  final ScrollController scrollController;
  final List<ChatModel>? chatList;

  const _BodySection({
    Key? key,
    required this.scrollController,
    this.chatList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList!.length,
      shrinkWrap: true,
      controller: scrollController,
      scrollDirection: Axis.vertical,
      dragStartBehavior: DragStartBehavior.down,
      padding:const EdgeInsets.only(top: 25.0, left: 18.0),
      itemBuilder: (context, index) {
        var chat = chatList![index];
        return _BuildChatBubble(
          chat: chat,
        );
      },
    );
  }
}
