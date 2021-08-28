part of '../chat_page.dart';

class _BuildChatBubble extends StatelessWidget {
  final ChatModel chat;

  const _BuildChatBubble({required this.chat});

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
          margin: const EdgeInsets.only(bottom: 24),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    CustomIcon.logo,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.only(right: 25),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(chat.message!, style: theme.textTheme.bodyText2),
                    const SizedBox(height: 5),
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
          margin: const EdgeInsets.only(bottom: 24),
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.only(right: 25),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
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
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat.jm().format(chat.sendTime!),
                          style: theme.textTheme.subtitle2!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Icon(chat.isRead! ? Icons.done_all : Icons.done,
                            color: theme.backgroundColor, size: 10),
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
