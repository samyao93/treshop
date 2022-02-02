part of '../profile_edit_page.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _adddressController;

  bool _isLoading = false;

  static const String _userImage =
      'https://i.pinimg.com/564x/fc/30/65/fc30653203c453c33b12d66f6837b6d5.jpg';
  static const String _username = 'dickyrey99';
  static const String _email = 'developer@treshop.com';
  static const String _phoneNumber = '081345071707';
  static const String _address =
      'Home 403 Oakland Ave Street, A city, Florida, 32104, United States of America';

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: _username);
    _emailController = TextEditingController(text: _email);
    _phoneNumberController = TextEditingController(text: _phoneNumber);
    _adddressController = TextEditingController(text: _address);
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _adddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.edit_profile,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const _BuildCircleAvatar(userImage: _userImage),
          const SizedBox(height: Const.space25),
          _BuildListTale(
            label: AppLocalizations.of(context)!.username,
            text: _username,
            controller: _usernameController,
            icon: FeatherIcons.user,
          ),
          const SizedBox(height: Const.space15),
          _BuildListTale(
            label: AppLocalizations.of(context)!.email,
            text: _email,
            controller: _emailController,
            icon: FeatherIcons.mail,
          ),
          const SizedBox(height: Const.space15),
          _BuildListTale(
            label: AppLocalizations.of(context)!.phone_number,
            text: _phoneNumber,
            controller: _phoneNumberController,
            icon: FeatherIcons.phone,
          ),
          const SizedBox(height: Const.space15),
          _BuildListTale(
            label: AppLocalizations.of(context)!.primary_address,
            text: _address,
            controller: _adddressController,
            icon: FeatherIcons.mapPin,
          ),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            onTap: () {
              setState(() => _isLoading = true);
              Future.delayed(const Duration(seconds: 2), () {
                setState(() => _isLoading = false);
                Get.back<dynamic>();
                showToast(msg: AppLocalizations.of(context)!.profile_updated);
              });
            },
            label: AppLocalizations.of(context)!.save,
            isLoading: _isLoading,
          )
        ],
      ),
    );
  }
}
