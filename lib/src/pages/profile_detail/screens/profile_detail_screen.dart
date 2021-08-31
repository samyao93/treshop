part of '../profile_detail_page.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  static const String _userImage = 'https://i.pinimg.com/564x/fc/30/65/fc30653203c453c33b12d66f6837b6d5.jpg';
  static const String _username = 'dickyrey99';
  static const String _email = 'developer@treshop.com';
  static const String _phoneNumber = '081345071707';
  static const String _address = 'Home 403 Oakland Ave Street, A city, Florida, 32104, United States of America';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context,
          title: AppLocalizations.of(context)!.profile,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed<dynamic>(Routes.profileEdit),
              icon: const Icon(FeatherIcons.edit),
              color: _theme.primaryColor,
            ),
          ]),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const Align(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(_userImage),
            ),
          ),
          const SizedBox(height: Const.space25),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.username,
            text: _username,
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.email,
            text: _email,
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.phone_number,
            text: _phoneNumber,
          ),
          const SizedBox(height: Const.space15),
          _BuildProfileTile(
            label: AppLocalizations.of(context)!.primary_address,
            text: _address,
          ),
          const SizedBox(height: Const.space25),
        ],
      ),
    );
  }
}

