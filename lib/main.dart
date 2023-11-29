import 'package:yoven/auth/splash_screen.dart';
import 'package:yoven/helpers/localizations/app_localization_delegate.dart';
import 'package:yoven/helpers/localizations/language.dart';
import 'package:yoven/helpers/theme/app_notifier.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  AppTheme.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: SplashScreen(),
            builder: (context, child) {
              return Directionality(
                textDirection: AppTheme.textDirection,
                child: child ?? Container(),
              );
            },
            localizationsDelegates: [
              AppLocalizationsDelegate(context),
              // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Language.getLocales(),
            // home: IntroScreen(),
            // home: CookifyShowcaseScreen(),
          );
        });

  }
}
