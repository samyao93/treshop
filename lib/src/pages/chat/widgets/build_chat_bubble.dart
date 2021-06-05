part of '../chat_page.dart';

class _BuildChatBubble extends StatelessWidget {
  final ChatModel chat;

  _BuildChatBubble({required this.chat});

  @override
  Widget build(BuildContext context) {
    return chat.isByMe!
        ? senderChatBubble(context)
        : receiverChatBubble(context);
  }

  Align receiverChatBubble(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    CustomIcon.logo,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                margin: EdgeInsets.only(right: 25.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(.2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(chat.message!, style: theme.textTheme.bodyText2),
                    SizedBox(height: 5.0),
                    Text(DateFormat.jm().format(chat.sendTime!),
                        style: theme.textTheme.subtitle2),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Align senderChatBubble(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 10.0),
              Container(
                margin: EdgeInsets.only(right: 25.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chat.message!,
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: theme.backgroundColor),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat.jm().format(chat.sendTime!),
                          style: theme.textTheme.subtitle2!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(chat.isRead! ? Icons.done_all : Icons.done,
                            color: theme.backgroundColor, size: 10.0),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
