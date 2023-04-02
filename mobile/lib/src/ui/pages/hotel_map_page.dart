import 'package:djepe/src/ui/pages/list_view_hotel_page.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/map/hotel_map.dart';
import 'package:djepe/src/ui/widgets/map/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../models/site.dart';

class HotelMapPage extends StatelessWidget {
  const HotelMapPage({super.key, required this.origin});

  final Site origin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: Stack(
        children: [
          HotelMapWidget(SitePosition: origin.location ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              padding: EdgeInsets.only(bottom: 15,top: 50 ),
              height: size.height*0.15,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),
                color: primary
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new, color: body,)),
                  Center(child: Text("Trouver un hotel à proximité",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: body),)),
                  SizedBox(width: 24,)
                ],
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                        width: size.width*0.9,
                        height: size.height*0.075,
                        child: ElevatedButton(onPressed: (){
                          Get.to(ListViewPage());
                        },child: Text("Lister les Hôtels"),style: ElevatedButton.styleFrom(backgroundColor: primary,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
                      ),
              )
              
              ]),
        ],
      ));
  }
}