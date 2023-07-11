import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gotogym/screens/home_screen.dart';
import 'package:gotogym/screens/login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'firebase_options.dart';

void main() async {
  await initializeDateFormatting();
  KakaoSdk.init(
    nativeAppKey: 'cf7ffb18f04b730bfef2d16a85d82071',
    //javaScriptAppKey: '${YOUR_JAVASCRIPT_APP_KEY}',
  );

  //firebase초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
