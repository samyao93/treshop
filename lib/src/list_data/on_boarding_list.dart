import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helpers/constants.dart';
import '../models/on_boarding_model.dart';

class OnBoardingList {
  static List<OnBoardingModel> onBoardingList(BuildContext context) => [
    OnBoardingModel(
      image: Images.on_boarding_1,
      title: AppLocalizations.of(context)!.on_boarding_title_1,
      subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_1,
    ),
    OnBoardingModel(
      image: Images.on_boarding_2,
      title: AppLocalizations.of(context)!.on_boarding_title_2,
      subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_2,
    ),
    OnBoardingModel(
      image: Images.on_boarding_3,
      title: AppLocalizations.of(context)!.on_boarding_title_1,
      subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_2,
    ),

  ];
}
