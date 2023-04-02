import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/image_box/image_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HCarouselItem extends StatefulWidget {
  const HCarouselItem({super.key});

  @override
  State<HCarouselItem> createState() => _HCarouselItemState();
}

class _HCarouselItemState extends State<HCarouselItem> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.6,
      height: size.height*0.3,
      child: Stack( 
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage("assets/images/cascade.jpeg"),fit: BoxFit.cover)
            ),
          ),
          Positioned(top: 0, left: 0, child: ElevatedButton(onPressed: (){
            setState(() {
              isLiked = !isLiked;
            });
          }, style: ElevatedButton.styleFrom(
                  backgroundColor: secondary,
                  foregroundColor: body,
                  shape: CircleBorder()
                ), child: isLiked ? FaIcon(FontAwesomeIcons.solidHeart, size: 17,color: milkShake,) : FaIcon(FontAwesomeIcons.heart, size: 16,color: milkShake,),),),
          Positioned(bottom: 10, right: 10, child: ImageTag(isRating: false,)),
        ],
      ),
    );
  }
}