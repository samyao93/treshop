part of '../profile_page.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: AppLocalizations.of(context)!.profile,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            leading: Icon(FeatherIcons.user, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.detail_profile, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            leading: Icon(FeatherIcons.truck, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.my_orders, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            leading: Icon(FeatherIcons.creditCard, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.wallet, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            leading: Icon(FeatherIcons.gift, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.my_coupon, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            leading: Icon(FeatherIcons.messageCircle, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.chat_with_us, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            leading: Icon(FeatherIcons.logOut, color: theme.hintColor),
            title: AutoSizeText(AppLocalizations.of(context)!.log_out, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            title: AutoSizeText(AppLocalizations.of(context)!.help, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            title: AutoSizeText(AppLocalizations.of(context)!.privacy_policy, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            title: AutoSizeText(AppLocalizations.of(context)!.about_us, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: (){
              //TODO:
            },
            title: AutoSizeText(AppLocalizations.of(context)!.contact_us, style: theme.textTheme.headline3),
            trailing: Icon(FeatherIcons.chevronRight,size:16.0, color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
