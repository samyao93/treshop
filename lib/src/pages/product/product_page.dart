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

import '../../helpers/colors.dart';
import '../../helpers/constants.dart';
import '../../helpers/screens.dart';
import '../../helpers/snack_toast.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_network_image.dart';

part 'screens/product_screen.dart';
part 'widgets/build_app_bar.dart';
part 'widgets/build_description.dart';
part 'widgets/build_item_color.dart';
part 'widgets/build_item_size.dart';
part 'widgets/build_name_and_rating.dart';
part 'widgets/footer_section.dart';
