import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/image_box/image_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SiteListTile extends StatefulWidget {
  const SiteListTile({super.key});

  @override
  State<SiteListTile> createState() => _SiteListTileState();
}

class _SiteListTileState extends State<SiteListTile> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: sub_text)]
        ),
        height: size.height*0.17,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage("assets/images/cascade.jpeg"),fit: BoxFit.cover)
                  ),
                ),
                Positioned(top: 0, left: -5, child: ElevatedButton(onPressed: (){
            setState(() {
              isLiked = !isLiked;
            });
          }, style: ElevatedButton.styleFrom(
                  backgroundColor: secondary,
                  foregroundColor: body,
                  shape: CircleBorder()
                ), child: isLiked ? FaIcon(FontAwesomeIcons.solidHeart, size: 17,color: milkShake,) : FaIcon(FontAwesomeIcons.heart, size: 16,color: milkShake,),),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: size.width*0.5,
                child: Column(
                  children: [
                    Text("Cascade de Kpimé"),
                    Text("Brève description du site Brève du site description du site description du site ",textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: sub_text),),
                    SizedBox(height: 10,),
                    ImageTag(isRating: false,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}