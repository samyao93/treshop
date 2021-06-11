import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/custom_elevated_button.dart';
import 'colors.dart';

class Dialogs {
 static Future showDialogWithLabel(
    BuildContext context, {
    String? title,
    String? labelButton,
    VoidCallback? onTapButton,
    bool barrierDismissible = false,
  }) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          content: SizedBox(
            height: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 45.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: Get.back,
                          color: Colors.white,
                          labelColor: ColorLight.fontTitle,
                          label: AppLocalizations.of(context)?.cancel,
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: onTapButton,
                          label: labelButton,
                          labelColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
