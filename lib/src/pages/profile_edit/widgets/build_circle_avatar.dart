part of '../profile_edit_page.dart';

class _BuildCircleAvatar extends StatelessWidget {
  const _BuildCircleAvatar({
    Key? key,
    required String userImage,
  })  : _userImage = userImage,
        super(key: key);

  final String _userImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>_onModalBottomSheetTap(context),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: CachedNetworkImageProvider(_userImage),
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black54,
            child: Icon(
              FeatherIcons.camera,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
