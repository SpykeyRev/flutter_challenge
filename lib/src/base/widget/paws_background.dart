import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/resources/res.dart';

///Just a simple background create with emojis
class PawsBackground extends StatelessWidget {
  const PawsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(-20, 40),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "🐾",
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.padding * 2),
                  child: Text(
                    "🐾",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.padding * 4),
                  child: Text(
                    "🐾",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                SizedBox(
                  height: Sizes.padding,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(-10, 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "🐾",
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.padding * 2),
                  child: Text(
                    "🐾",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.padding * 4),
                  child: Text(
                    "🐾",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Sizes.padding * 6),
                  child: Text(
                    "🐾",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                SizedBox(
                  height: Sizes.padding,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
