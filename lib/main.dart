import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/routing/router.dart';
import 'package:starkwager/utils/provider_observer.dart';

import 'core/providers/app_theme_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Localization
  await EasyLocalization.ensureInitialized();

  runApp(ProviderScope(
      observers: [AppObserver()],
      child: EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        useOnlyLangCode: true,
        child: MainApp(),
      )));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);

    return _EagerInitialization(
      child: MaterialApp.router(
        theme: context.lightTheme,
        darkTheme: context.darkTheme,
        themeMode: themeMode.value,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Container(child: child);
        },
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  final Widget child;

  const _EagerInitialization({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}
