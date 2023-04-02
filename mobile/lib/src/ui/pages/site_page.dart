import 'package:djepe/src/ui/pages/list_view_site_page.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/map/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/map/site_map.dart';

class SiteScreen extends StatelessWidget {
  const SiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(color: body,),
      child: Stack(
        children: [
          SiteMapWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              padding: EdgeInsets.only(left: size.width*0.07, right: size.width*0.07,),
              height: size.height*0.1,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),
                color: primary
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 30,),
                  Center(child: Text("Trouver un site Touristique",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: body),)),
                  SizedBox(
                    height: size.height*0.06,
                    width: size.height*0.06,
                    child: FloatingActionButton( backgroundColor: primary,shape: OutlineInputBorder( borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: sub_text)), onPressed: (){
                      Get.to(ListViewSitePage());
                    }, child: Icon(Icons.search),))
                ],
              ),
              ),
              
              ]),
        ],
      ));
  }
}