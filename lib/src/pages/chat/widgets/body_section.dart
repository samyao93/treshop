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
      dragStartBehavior: DragStartBehavior.down,
      padding:const EdgeInsets.only(top: 25, left: 18),
      itemBuilder: (context, index) {
        final chat = chatList![index];
        return _BuildChatBubble(
          chat: chat,
        );
      },
    );
  }
}
