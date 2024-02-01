import 'package:agent_picker/consts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback function;

  CustomButton({required this.text, required this.function});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double photoHeight = 0.0;

  Widget myStack(List<String> photos, width) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.18),
          child: Image.network(
            photos[0],
            fit: BoxFit.cover,
            height: photoHeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.18),
          child: Image.network(
            photos[1],
            fit: BoxFit.cover,
            height: photoHeight,
          ),
        ),
        Image.network(
          photos[2],
          fit: BoxFit.cover,
          height: photoHeight,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    photoHeight = height * 0.25; // initial value

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: height * 0.25,
        width: width * 0.41,
        child: ElevatedButton(
          onPressed: widget.function,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black38,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(KBorderRadiusButton), // Example value
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              (widget.text == "Random Agent")
                  ? Image.network(
                      "https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png",
                      fit: BoxFit.cover,
                      height: photoHeight,
                    )
                  : (widget.text == "Normal Team")
                      ? myStack([
                          "https://media.valorant-api.com/agents/eb93336a-449b-9c1b-0a54-a891f7921d69/fullportrait.png",
                          "https://media.valorant-api.com/agents/5f8d3a7f-467b-97f3-062c-13acf203c006/fullportrait.png",
                          "https://media.valorant-api.com/agents/22697a3d-45bf-8dd7-4fec-84a9e28c69d7/fullportrait.png"
                        ], width)
                      : myStack([
                          "https://media.valorant-api.com/agents/8e253930-4c05-31dd-1b6c-968525494517/fullportrait.png",
                          "https://media.valorant-api.com/agents/117ed9e3-49f3-6512-3ccf-0cada7e3823b/fullportrait.png",
                          "https://media.valorant-api.com/agents/9f0d8ba9-4140-b941-57d3-a7ad57c6b417/fullportrait.png"
                        ], width),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: width * 0.052,
                  fontFamily: "CustomFont",
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
