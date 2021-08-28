part of '../profile_detail_page.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  static const String _userImage =
      'https://i.pinimg.com/564x/fc/30/65/fc30653203c453c33b12d66f6837b6d5.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.detail_profile,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const _BuildProfileImage(userImage: _userImage),
          const SizedBox(height: Const.space25),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.username,
            text: 'Dickyrey',
            onEditTap: () {},
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.email,
            text: 'example@treshop.co.uk',
            onEditTap: () {},
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.phone_number,
            text: '081345071707',
            onEditTap: () {},
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.primary_address,
            text:
                // ignore: lines_longer_than_80_chars
                'Home 403 Oakland Ave Street, A city, Florida, 32104, United States of America',
            onEditTap: () {},
          ),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            onTap: () {},
            label: AppLocalizations.of(context)!.save,
          )
        ],
      ),
    );
  }
}

class _BuildProfileTile extends StatelessWidget {
  final String label;
  final String text;
  final VoidCallback? onEditTap;

  const _BuildProfileTile(
      {Key? key, required this.label, required this.text, this.onEditTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          label,
          style: theme.textTheme.subtitle1,
        ),
        const SizedBox(height: Const.space8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                text,
                style: theme.textTheme.bodyText2,
              ),
            ),
            const SizedBox(width: Const.space25),
            InkWell(
              onTap: onEditTap,
              child: AutoSizeText(
                AppLocalizations.of(context)!.edit,
                style: theme.textTheme.button!.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _BuildProfileImage extends StatelessWidget {
  const _BuildProfileImage({
    Key? key,
    required String userImage,
  })  : _userImage = userImage,
        super(key: key);

  final String _userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
