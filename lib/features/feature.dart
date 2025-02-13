import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reown_appkit/modal/appkit_modal_impl.dart';
import 'package:starkwager/core/constants/screen_size.dart';
import 'package:starkwager/core/providers/navigation_provider.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/extensions/currency_extension.dart';
import 'package:starkwager/features/create_wager/provider/hashtag_provider.dart';

import '../core/constants/app_values.dart';
import '../core/constants/assets.dart';
import '../core/constants/screen_layout.dart';
import '../routing/routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/ui_widgets.dart';
import 'connect_wallet/provider/wallet_connection_provider.dart';
import 'connect_wallet/provider/wallet_connection_state.dart';
import 'create_wager/provider/category_provider.dart';

part 'component/button/primary_button.dart';
part 'component/editText/username_editText.dart';
part 'connect_wallet/connect_wallet_screen.dart';
part 'connect_wallet/widgets/installed_wallet_widget.dart';
part 'create_wager/create_wager_screen.dart';
part 'create_wager/wager_summary.dart';
part 'home_screen/home_screen.dart';
part 'home_screen/naviagtion.dart';
part 'home_screen/widget/home_action_button.dart';
part 'home_screen/widget/home_add_and_withdraw.dart';
part 'home_screen/widget/home_bottom_navigation.dart';
part 'home_screen/widget/home_screen_app_bar.dart';
part 'home_screen/widget/home_screen_body.dart';
part 'home_screen/widget/home_screen_tablet_menu_bar.dart';
part 'home_screen/widget/home_screen_tablet_mode.dart';
part 'home_screen/widget/profile_menu.dart';
part 'home_screen/widget/copy_item_container.dart';
part 'fund_wallet/widgets/fund_wallet_dialog.dart';

part 'component/appbar/base_appbar.dart';
part 'profile_setup/profile_setup_screen.dart';
part 'profile_screen.dart/profile_screen.dart';

part 'wager_created/wager_created_screen.dart';
part 'wager_created/widgets/wager_created_body.dart';

part 'wager_screen/widget/mobile_body.dart';
part 'wager_screen/widget/tab_widget.dart';
part 'wager_screen/widget/wager_widget.dart';
part 'wager_screen/active_screen.dart';
part 'wager_screen/complete_screen.dart';
part 'wager_screen/pending_screen.dart';
part 'wager_screen/wagers_screen.dart';
part 'wallet_screen.dart/wallet_screen.dart';
