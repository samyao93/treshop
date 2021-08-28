import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/models/on_boarding_model.dart';
 

class OnBoardingList {
  static List<OnBoardingModel> onBoardingList(BuildContext context) => [
    OnBoardingModel(
      image: Images.onBoarding1,
      title: AppLocalizations.of(context)!.on_boarding_title_1,
      subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_1,
    ),
    OnBoardingModel(
      image: Images.onBoarding2,
      title: AppLocalizations.of(context)!.on_boarding_title_2,
      subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_2,
    ),
    OnBoardingModel(
      image: Images.onBoarding3,
      title: AppLocalizations.of(context)!.on_boarding_title_1,
      subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_2,
    ),

  ];
}
