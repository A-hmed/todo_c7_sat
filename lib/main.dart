import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_sat/providers/listProvider.dart';
import 'package:todo_c7_sat/ui/screens/home/home.dart';
import 'package:todo_c7_sat/utils/my_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);/// to unlimit cache size
  await FirebaseFirestore.instance.disableNetwork(); /// to deal with local storage only

  runApp(ChangeNotifierProvider(
    create: (_)=> ListProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale("en"),
      routes: {
        Home.routeName: (_)=>Home()
      },
      initialRoute: Home.routeName,
    );
  }
}
