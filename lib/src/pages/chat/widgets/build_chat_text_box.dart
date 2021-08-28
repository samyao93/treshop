part of '../chat_page.dart';

class _BuildChatTextBox extends StatelessWidget {
  final VoidCallback? onUploadFileTap;
  final VoidCallback? onSendTap;
  final TextEditingController? textController;

  const _BuildChatTextBox(
      {Key? key, this.onUploadFileTap, this.textController, this.onSendTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ThemeProvider>(builder: (context, state, snapshot) {
      return Card(
        margin:  EdgeInsets.zero,
        
        child: Container(
          width: Screens.width(context),
          height: 60,
          color: theme.backgroundColor,
          child: Row(
            children: <Widget>[
              IconButton(
                icon:const Icon(Icons.file_upload),
                color: state.isLightTheme
                    ? ColorDark.background
                    : ColorLight.background,
                onPressed: onUploadFileTap,
              ),
              Expanded(
                child: Container(
                  height: 45,
                  padding:const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: state.isLightTheme
                        ? ColorLight.background
                        : ColorDark.background,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: TextField(
                      cursorColor: theme.primaryColor,
                      style: theme.textTheme.bodyText2,
                      controller: textController,
                      decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.write_a_message,
                          hintStyle: theme.textTheme.subtitle2,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding:const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 15)),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon:const Icon(Icons.send),
                color: theme.primaryColor,
                onPressed: onSendTap,
              ),
            ],
          ),
        ),
      );
    });
  }
}
