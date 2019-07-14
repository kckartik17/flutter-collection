import 'package:flutter/material.dart';
import 'package:minion_app/models/character.dart';
import 'package:minion_app/styleguide.dart';
import 'package:minion_app/pages/character_detail_screen.dart';

class CharacterWidget extends StatelessWidget {
  final int index;

  const CharacterWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1000),
                pageBuilder: (context, _, __) =>
                    CharacterDetailScreen(character: characters[index])));
      },
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero(
                tag: "background-${characters[index].name}",
                child: Container(
                  height: 0.6 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: characters[index].colors,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10.0,
            child: Hero(
              tag: "image-${characters[index].name}",
              child: Image.asset(
                characters[index].imagePath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: "name-${characters[index].name}",
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${characters[index].name}",
                          style: AppTheme.heading),
                      TextSpan(text: "\n"),
                      TextSpan(
                          text: "Tap to know more", style: AppTheme.subHeading)
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 50;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
