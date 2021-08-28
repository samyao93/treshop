import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/snack_toast.dart';

enum AuthStatus { notAuthenticated, authenticated }
// enum Gender { male, female }

class AuthenticationProvider with ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  void obscureTextChanged() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  AuthStatus _authStatus = AuthStatus.notAuthenticated;
  AuthStatus get authStatus => _authStatus;
  set authStatus(AuthStatus val) {
    _authStatus = val;
    notifyListeners();
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String val) {
    _gender = val;
    notifyListeners();
  }

  List<String> _genderList = ['Male', 'Female'];
  List<String> get genderList => _genderList;
  set genderList(List<String> val) {
    _genderList = val;
    notifyListeners();
  }

  Future signIn(BuildContext context, {String? email, String? password}) async {
    return Future<dynamic>.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed<dynamic>(Routes.home);
      authStatus = AuthStatus.authenticated;
      showToast(msg: AppLocalizations.of(context)!.authenticated_as + email!);
      isLoading = false;
    });
  }

  Future signUp(
    BuildContext context, {
    String? username,
    String? email,
    String? password,
  }) async {
    return Future<dynamic>.delayed(
      const Duration(seconds: 2),
      () async {
        await Get.offAllNamed<dynamic>(Routes.home);
        authStatus = AuthStatus.authenticated;
        await showToast(
          // ignore: use_build_context_synchronously
          msg: AppLocalizations.of(context)!.authenticated_as + username!,
        );
        isLoading = false;
      },
    );
  }
}
