import 'package:carousel_slider/carousel_slider.dart';
import 'package:djepe/src/ui/pages/list_view_hotel_page.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/list_tile/home_page_site_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/image_box/home_page_h_carousel_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(color: body,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          padding: EdgeInsets.only(bottom: 10, left: size.width*0.07, right: size.width*0.07,),
          height: size.height*0.2,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),
            color: primary
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 8),
                  child: Text("LOGO", style: TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.w700),),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: size.width*0.12,
                width: size.width*0.73,
                      child: TextField(
                        controller: controller,
                        style: Theme.of(context).textTheme.bodySmall,
                        onSubmitted: (value) {
             Get.to(ListViewPage(searchValue: controller.value,));
        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          fillColor: body,
                          filled: true,
                          hintText: "Recherchez un site",
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: sub_text)
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.12,
                      width: size.width*0.12,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: body,
                        elevation: 10,
                        shadowColor: sub_text,
                        padding: EdgeInsets.zero,
                        side: BorderSide(color: sub_text,width: 2)
                      ) ,onPressed:(){}, child: FaIcon(FontAwesomeIcons.search, color: body,)))
                //     Container(
                //       height: size.width*0.12,
                // width: size.width*0.12,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(5),
                //   color: primary,
                //   boxShadow: [BoxShadow(color: sub_text, offset: Offset(0, 1), blurRadius: 4),BoxShadow(color: sub_text, offset: Offset(0, -1), blurRadius: 2),],
                //   border: Border.all(color: sub_text)
                // ),
                // child: Center(child: ),
                //     )
                  ],
                ),
        Padding(padding: EdgeInsets.only(top: 15), child: Text("Trouver un site touristique et accéder aux hôtels à proximité",textAlign: TextAlign.center,style: TextStyle(color: light_grey_v, fontSize: 11),),),

              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(padding: EdgeInsets.only(top: 15, left: 20), child: Text("Les mieux notés",textAlign: TextAlign.left,),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CarouselSlider(
             items: [
                    HCarouselItem(),
                    HCarouselItem(),
                    HCarouselItem(),
             ],
             options: CarouselOptions(
                viewportFraction: 0.55,
                aspectRatio: 1.6,
                enableInfiniteScroll: true,
                reverse: false,
                disableCenter: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                pageSnapping: false,
                enlargeFactor: 0.4,
                scrollDirection: Axis.horizontal,
             )
           ),
           
              
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
                    
              //     ],
              //   ),
              // ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10, left: 20, right: 20), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommandés pour vous",textAlign: TextAlign.left,),
                Icon(Icons.arrow_drop_up_outlined, size: 28,)
              ],
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  child: Column(children: [
                    SiteListTile(),
                    SiteListTile(),
                    SiteListTile(),
                    SiteListTile(),
                    SizedBox(height: 60,)
                  ]),
                ),
              ),
            ],),
          ),
        )
      ]),
    );
  }
}