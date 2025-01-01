import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/home-screen.dart';
import 'package:news/home/myTheme.dart';
import 'package:news/my_bloc_observer.dart';
import 'package:news/news/news_details_screen.dart';
import 'package:news/provider/app-configuration-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));


}
class MyApp extends StatelessWidget {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context)=> NewsDetailsScreen(),
      },
      theme: MyTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

  Future<void> initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    var language = prefs.getString('language');
    if (language != null) {
      provider.changeLanguage(language);
    }
  }
}
