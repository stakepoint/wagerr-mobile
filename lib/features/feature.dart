import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/wager_screen.dart/provider/navigation_provider.dart';
import '../core/constants/app_values.dart';
import '../core/constants/assets.dart';
import '../core/constants/screen_layout.dart';
import '../routing/routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/ui_widgets.dart';
import 'connect_wallet/provider/connect_wallet_provider.dart';
import 'dart:math' as math;

part 'connect_wallet/widgets/installed_wallet_widget.dart';
part 'connect_wallet/connect_wallet_screen.dart';

part 'fund_wallet/widgets/fund_wallet_dialog.dart';
part 'home_screen/widget/home_action_button.dart';
part 'home_screen/widget/home_add_and_withdraw.dart';
part 'home_screen/widget/home_bottom_navigation.dart';
part 'home_screen/widget/home_screen_app_bar.dart';
part 'home_screen/widget/home_screen_body.dart';
part 'home_screen/widget/home_screen_tablet_menu_bar.dart';
part 'home_screen/widget/home_screen_tablet_mode.dart';
part 'home_screen/widget/profile_menu.dart';
part 'home_screen/home_screen.dart';
part 'home_screen/naviagtion.dart';

part 'profile/profile_setup_screen.dart';
part 'profile_screen.dart/profile_screen.dart';

part 'wager_created/widgets/button.dart';
part 'wager_created/widgets/general_text_form_field.dart';
part 'wager_created/widgets/wager_created_app_bar.dart';
part 'wager_created/widgets/wager_created_body.dart';
part 'wager_created/widgets/wager_profile_menu.dart';
part 'wager_created/wager_created_screen.dart';

part 'wager_screen.dart/widget/mobile_body.dart';
part 'wager_screen.dart/widget/tab_widget.dart';
part 'wager_screen.dart/widget/wager_widget.dart';
part 'wager_screen.dart/active_screen.dart';
part 'wager_screen.dart/complete_screen.dart';
part 'wager_screen.dart/create_wager_screen.dart';
part 'wager_screen.dart/pending_screen.dart';
part 'wager_screen.dart/wager_summary.dart';
part 'wager_screen.dart/wagers_screen.dart';

part 'wallet_screen/wallet_screen.dart';
part 'wallet_screen/widget/wallet_screen_app_bar.dart';
part 'wallet_screen/widget/waltet_action_button.dart';
part 'wallet_screen/widget/waltet_add_and_withdraw.dart';
part 'wallet_screen/widget/waltet_screen_body.dart';
part 'wallet_screen/widget/waltet_screen_tablet_mode.dart';
