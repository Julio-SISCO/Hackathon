import 'package:djepe/src/data/api/site_services.dart';
import 'package:djepe/src/models/site.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../data/api/hotel_services.dart';
import '../../models/hotel.dart';
import '../theme/color.dart';
import '../widgets/empty_view.dart';

class ListViewSitePage extends StatelessWidget {
  ListViewSitePage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        
        body: Column(
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
                  Center(child: Text("Rechercher un site",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: body,fontSize: 16),)),
                  SizedBox(width: 24,)
                ],
              ),
              ),
            FutureBuilder<List<Site>>(
                future: SiteServices.getHotels(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      height: size.height,
                      color: white,
                      child: Column(
                        children: [
                         SizedBox(),
                         SizedBox(),
                         SizedBox(),
                         SizedBox(),
                        ],
                      ),
                    );
                  }

                  var data = snapshot.data!;

                  // return Text(data[0].libelle);
                  return ListSites(data, context);
                }),
          ],
        ));
  }

  Padding ListSites(List<Site> data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SearchableList<Site>(
        initialList: data,
        builder: (Site site) => GestureDetector(),
        
        filter: (value) => data
            .where(
              (element) => element.name.toLowerCase().contains(value),
            )
            .toList(),
        emptyWidget: const EmptyView(),
        searchTextController: _controller,
        inputDecoration: InputDecoration(
          fillColor: Colors.white,
          hintText: "Recherche...",
          prefixIcon: const Icon(Icons.search, color: milkShake,),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
            
          ),
        ),
        ));}
}