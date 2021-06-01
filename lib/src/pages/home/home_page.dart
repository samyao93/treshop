import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../helpers/constants.dart';
import '../../helpers/screens.dart';
import '../../list_data/category_list.dart';
import '../../list_data/product_list.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';

part 'screens/home_screen.dart';
part 'widgets/build_label_section.dart';
part 'widgets/build_search.dart';
