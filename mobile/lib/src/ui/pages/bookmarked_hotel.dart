import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/widgets/list_tile/hotel_list_tile.dart';
import 'package:flutter/material.dart';

class BookmarkedHostel extends StatelessWidget {
  const BookmarkedHostel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: body,
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: size.width*0.07, right: size.width*0.07 ),
              height: size.height*0.1,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),
                color: primary
              ),
              child: Center(child: Text("Mes Hôtels",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: body, fontSize: 17),)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HotelListTile(),
                        HotelListTile(),
                        HotelListTile(),
                        SizedBox(height: 90,)
                    ],
                  ),
                ),
              )
          
        ],
      )
    );
  }
}