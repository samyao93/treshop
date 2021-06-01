
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../helpers/colors.dart';
import '../../helpers/constants.dart';
import '../../helpers/screens.dart';
import '../../helpers/snack_toast.dart';
import '../../list_data/address_list.dart';
import '../../list_data/coupon_list.dart';
import '../../list_data/payment_list.dart';
import '../../list_data/shipping_list.dart';
import '../../models/checkout_model.dart';
import '../../providers/address_card.dart';
import '../../providers/cart_provider.dart';
import '../../providers/checkout_provider.dart';
import '../../widgets/checkout_product_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_loading_indicator.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/empty_section.dart';

part 'screens/checkout_screen.dart';
part 'screens/checkout_success_screen.dart';
part 'widgets/build_address.dart';
part 'widgets/build_delivery_method.dart';
part 'widgets/build_label_section.dart';
part 'widgets/build_payment_method.dart';
part 'widgets/build_price_detail.dart';
part 'widgets/build_product.dart';
