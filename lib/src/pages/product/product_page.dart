import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:treshop/src/helpers/colors.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/screens.dart';
import 'package:treshop/src/helpers/snack_toast.dart';
import 'package:treshop/src/models/cart_model.dart';
import 'package:treshop/src/models/product_model.dart';
import 'package:treshop/src/providers/cart_provider.dart';
import 'package:treshop/src/providers/product_provider.dart';
import 'package:treshop/src/widgets/custom_elevated_button.dart';
import 'package:treshop/src/widgets/custom_network_image.dart';

part 'screens/product_screen.dart';
part 'widgets/build_app_bar.dart';
part 'widgets/build_description.dart';
part 'widgets/build_item_color.dart';
part 'widgets/build_item_size.dart';
part 'widgets/build_name_and_rating.dart';
part 'widgets/footer_section.dart';
