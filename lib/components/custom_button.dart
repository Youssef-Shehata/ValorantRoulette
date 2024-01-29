import 'package:flutter/material.dart';

import '../consts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  CustomButton({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: height * 0.25,
        width: width * 0.41,
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black38,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(KBorderRadiusButton))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              (text == "Random Agent")
                  ? Image.network(
                      "https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png")
                  : Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.18),
                          child: Image.network(
                              "https://media.valorant-api.com/agents/8e253930-4c05-31dd-1b6c-968525494517/fullportrait.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.18),
                          child: Image.network(
                              "https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/fullportrait.png"),
                        ),
                        Image.network(
                            "https://media.valorant-api.com/agents/9f0d8ba9-4140-b941-57d3-a7ad57c6b417/fullportrait.png")
                      ],
                    ),
              Text(
                text,
                style: TextStyle(fontSize: width * 0.052),
              )
            ],
          ),
        ),
      ),
    );
  }
}
