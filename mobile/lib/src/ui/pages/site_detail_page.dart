import 'package:djepe/src/data/static/sites.dart';
import 'package:djepe/src/ui/pages/hotel_map_page.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/image_box/image_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/site.dart';
import 'list_view_hotel_page.dart';

class SiteDetails extends StatelessWidget {
  const SiteDetails({super.key, required this.site});

  final Site site;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height*0.75,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://www.togofirst.com/media/k2/items/cache/82eeb073637abf7deb47458b04912510_L.jpg'),fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back_ios_new), backgroundColor: primary,),
              FloatingActionButton(onPressed: (){Get.to(HotelMapPage(origin: sites.first ,));}, child: FaIcon(FontAwesomeIcons.hotel), backgroundColor: primary,),
                ],
              ),),

              Container(
                width: size.width,
                height: size.height*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                  color: body,
                  boxShadow: [BoxShadow(
                    blurRadius: 2,
                    color: sub_text,
                    offset: Offset(0, -1)
                  )]
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(site.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: text),),
                        ImageTag(isRating: false,)
                      ],
                    ),),
                    SizedBox(
                      width: size.width*0.85,
                      height: size.height*0.08,
                      child: Text("Brève de description du site de description du site de description du site de description du site de description du site",style: TextStyle(fontSize: 13, color: sub_text, fontWeight: FontWeight.w500)),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5), child: Divider(),),
                    SizedBox(
                      width: size.width*0.85,
                      height: size.height*0.05,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("2", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: text)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Hôtels dans un rayon de 5 Km", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: text),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    SizedBox(
                      width: size.width*0.9,
                      height: size.height*0.075,
                      child: ElevatedButton(onPressed: (){
                        Get.to(ListViewPage());
                      },child: Text("Lister les Hôtels"),style: ElevatedButton.styleFrom(backgroundColor: primary,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
                    )
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}