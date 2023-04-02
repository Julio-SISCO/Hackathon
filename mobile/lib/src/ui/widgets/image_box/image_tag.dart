import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageTag extends StatelessWidget {
  const ImageTag({super.key, required this.isRating});

  final bool isRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: MediaQuery.of(context).size.width*0.15,
      height: MediaQuery.of(context).size.width*0.05,

      decoration: BoxDecoration(
        color: light_button,
        borderRadius: BorderRadius.circular(2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        !isRating ? FaIcon(FontAwesomeIcons.solidHeart, size: 12,color: milkShake,):FaIcon(FontAwesomeIcons.solidStar, size: 12,color: milkShake,) ,
        Text("10 k", style: TextStyle(color: sub_text, fontSize: 11),)
      ]),
    );
  }
}