import 'package:agent_picker/pages/homepage.dart';
import 'package:agent_picker/pages/normal_team_page.dart';
import 'package:agent_picker/pages/one_agent.dart';

import 'package:agent_picker/pages/random_page.dart';
import 'package:agent_picker/pages/splash_screen.dart';
import 'package:agent_picker/themes/dark_theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomePage.id: (context) => HomePage(),
        RandomPage.id: (context) => RandomPage(),
        OneAgent.id: (context) => OneAgent(),
        NormalTeamPage.id: (context) => NormalTeamPage()
      },
    );
  }
}
