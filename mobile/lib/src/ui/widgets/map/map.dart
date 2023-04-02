import 'package:djepe/src/data/static/sites.dart';
import 'package:djepe/src/models/site.dart';
import 'package:djepe/src/ui/pages/site_detail_page.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../constants/mapBoxLink.dart';
import '../../pages/hotel_detail_page.dart';

class MapGeneric extends StatefulWidget {
  MapGeneric({
    super.key,
    
    required this.mapController, required this.isHotel, required this.radius, required this.origin, this.siteOrigin, required this.zoom, required this.hotelOrSiteMarker,
  });

  final List hotelOrSiteMarker; 
  final double zoom;
  final bool isHotel;
  final LatLng origin;
  final LatLng? siteOrigin;
  final Widget radius;
  final MapController mapController;

  @override
  State<MapGeneric> createState() => _MapGenericState();
}

class _MapGenericState extends State<MapGeneric> {

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        minZoom: 5,
        maxZoom: 20,
        zoom: widget.zoom,
        center: widget.origin,
      ),

      children: [

        TileLayer(
          urlTemplate:
              AppConstants.urlTemplate,
          additionalOptions: {
            'mapStyleId': AppConstants.mapBoxStyleId,
            'accessToken': AppConstants.mapBoxAccessToken,
          },
        ),
        widget.radius,
        MarkerLayer(
          markers: [
            for (int i = 0; i < widget.hotelOrSiteMarker.length; i++)
              Marker(
                height: 70,
                width: 90,
                point: widget.hotelOrSiteMarker[i].location ?? AppConstants.myLocation,
                builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      widget.isHotel ?
                        Get.to(HotelDetails(hotel: widget.hotelOrSiteMarker[i],))
                      :
                      Get.to(SiteDetails(site: widget.hotelOrSiteMarker[i],));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow(blurRadius: 2, color: Colors.blueGrey)],
                            color: body
                          ),
                          width: 90,
                          child: Text(widget.hotelOrSiteMarker[i].name!,textAlign: TextAlign.center, style: TextStyle(color: text,fontSize: 10,fontWeight: FontWeight.w800),),
                        ),
                        SizedBox(
                          height: 20,
                width: 20,
                          child: widget.isHotel ? SvgPicture.asset(
                              "assets/icons/svg/hostel_marker.svg")  : SvgPicture.asset(
                              "assets/icons/svg/site_marker.svg"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              widget.siteOrigin != null ?
               Marker(
                height: 50,
                width: 20,
                point: widget.siteOrigin!,
                builder: (_) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: milkShake.withOpacity(0.6), width: 5)
                        ),
                        child: Container(decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: text

                        ),),
                      ),
                      SvgPicture.asset(
                                  "assets/icons/svg/site_marker.svg", ),
                    ],
                  );
                },
              ) : Marker(
                height: 60,
                width: 20,
                point: widget.origin,
                builder: (_) {
                  return Icon(Icons.location_on, size: 34, color: red,);
                },
              ),
                          // My current position
            Marker(
                height: 60,
                width: 20,
                point: widget.origin,
                builder: (_) {
                  return GestureDetector(child: Icon(Icons.location_on, size: 34, color: red,), onTap: () => {},);
                },
              ),
          ],
        )
      ],
    );
  }
}
