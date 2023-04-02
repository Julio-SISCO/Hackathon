import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';

import '../image_box/image_tag.dart';

class HotelListTile extends StatelessWidget {
  const HotelListTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: SizedBox(
        height: size.height*0.28,
        width: size.width*0.95,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: size.width*0.05, top: size.height*0.03),
              decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: sub_text)]),
              height: size.height*0.25,
        width: size.width*0.9,
        child: Row(
            children: [
              Container(
                width: size.width*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage("assets/images/cascade.jpeg"),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: SizedBox(
                  width: size.width*0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Cascade de Kpimé",  style: TextStyle(fontSize: 16, color: text, fontWeight: FontWeight.w800,)),

                      Text("Brève description du site Brève du site description du site description du site ",textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: sub_text),),
                      SizedBox(height: 10,),
                      ImageTag(isRating: true,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
            FloatingActionButton(onPressed: (){}, child: Icon(Icons.bookmark, color: milkShake,size: 30,), backgroundColor: secondary,)
          ],
        ),
      ),
    );
  }
}