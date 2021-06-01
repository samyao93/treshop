
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:treshop/src/helpers/colors.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/screens.dart';
import 'package:treshop/src/list_data/address_list.dart';
import 'package:treshop/src/list_data/coupon_list.dart';
import 'package:treshop/src/list_data/payment_list.dart';
import 'package:treshop/src/list_data/product_list.dart';
import 'package:treshop/src/list_data/shipping_list.dart';
import 'package:treshop/src/models/address_model.dart';
import 'package:treshop/src/models/checkout_model.dart';
import 'package:treshop/src/models/product_model.dart';
import 'package:treshop/src/providers/address_card.dart';
import 'package:treshop/src/widgets/checkout_product_card.dart';
import 'package:treshop/src/providers/checkout_provider.dart';
import 'package:treshop/src/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:treshop/src/widgets/custom_elevated_button.dart';
import 'package:treshop/src/widgets/custom_network_image.dart';

part 'screens/checkout_screen.dart';
part 'widgets/build_label_section.dart';
