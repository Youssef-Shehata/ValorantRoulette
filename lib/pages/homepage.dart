import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../components/custom_button.dart';

class HomePage extends StatelessWidget {
  static const String id = 'homepage';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.13, horizontal: 8),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.games_outlined),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView(
                        shrinkWrap: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.25),
                        children: [
                          CustomButton(
                              text: "Random Agent",
                              function: () {
                                Navigator.of(context).pushNamed('one-agent');
                              }),
                          CustomButton(
                              text: "Random Team",
                              function: () {
                                Navigator.of(context).pushNamed('random-page');
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
