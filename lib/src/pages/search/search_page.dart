import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../helpers/screens.dart';
import '../../list_data/product_list.dart';
import '../../list_data/sort_and_filter_list.dart';
import '../../models/product_model.dart';
import '../../providers/search_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/product_card.dart';
import '../filter/filter_page.dart';

part 'screens/search_screen.dart';
part 'widgets/body_section.dart';
part 'widgets/build_sort_modal.dart';
part 'widgets/header_section.dart';
