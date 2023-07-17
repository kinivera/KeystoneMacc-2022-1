import 'package:flutter/material.dart';

class AboutText extends StatefulWidget {
  const AboutText({Key? key}) : super(key: key);

  @override
  State<AboutText> createState() => _AboutTextState();
}

class _AboutTextState extends State<AboutText> {
  static const TextStyle titleStyle = TextStyle(fontSize: 25);
  static const normalStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //About text!
        Text("""Why? 💗""", style: titleStyle),
        SizedBox(
          height: 10,
        ),
        Text(
          """We seek to contribute to the development of an agro-industrial revolution in Colombia that extends to the world, that makes life better for the farmer and for us, that allows us to eat better food, of better quality at a better price; where we can all share with others and receive from others their innovations, ready to implement.""",
          style: normalStyle,
        ),
        SizedBox(
          height: 40,
        ),

        Text(
          """How? 🤷🏽‍""",
          style: titleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          """We achieve this through open source, open access hardware, community software development. So feel free to clone and implement, expand or modify, this helps us in our mission to make agriculture open for everyone and easier to automate.""",
          style: normalStyle,
        ),
        SizedBox(
          height: 40,
        ),

        Text(
          """What? 📊""",
          style: titleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          """Maticas funds and materializes its cause through the sale and development of automated, open source hydroponic growing systems and open access hardware. And of course with donations.""",
          style: normalStyle,
        ),
      ],
    );
  }
}
