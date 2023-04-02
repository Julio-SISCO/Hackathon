import 'package:djepe/src/data/static/hotels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../theme/color.dart';
import 'map.dart';

class HotelMapWidget extends StatefulWidget {
  const HotelMapWidget({super.key, required this.SitePosition});

  final LatLng SitePosition;


  @override
  State<HotelMapWidget> createState() => _HotelMapWidgetState();
}

class _HotelMapWidgetState extends State<HotelMapWidget> {
   late MapController mapController;

  late LatLng initialPosition;

  late double initialZoom;

  late Position _currentPosition;

  Future<Position> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Vérifier si les services de localisation sont activés
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Les services de localisation ne sont pas activés, afficher une erreur ou une alerte
    return Future.error('Les services de localisation ne sont pas activés.');
  }

  // Vérifier si l'utilisateur a donné l'autorisation pour accéder à la position actuelle
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // L'utilisateur n'a pas encore donné l'autorisation, afficher une alerte pour lui demander
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // L'utilisateur a refusé l'autorisation, afficher une erreur ou une alerte
      return Future.error('L\'autorisation d\'accès à la position actuelle a été refusée.');
    }
  }

  // Obtenir la position actuelle de l'utilisateur
  return await Geolocator.getCurrentPosition();
}


  @override
  void initState() {
    initialZoom = 15;
    mapController = MapController();
    initialPosition = LatLng(6.136023, 1.230677);

    _getCurrentLocation().then((position) {
    setState(() {
      _currentPosition = position;
    });
  }).catchError((e) {
    // Afficher une erreur ou une alerte si la position actuelle ne peut pas être récupérée
    print(e);
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapGeneric(mapController: mapController, isHotel: true, origin: widget.SitePosition,zoom: initialZoom ,radius: 
        CircleLayer(
          circles: [
            CircleMarker(
              point: widget.SitePosition,
              useRadiusInMeter: true,
              radius: 1000, // en mètres
              color: milkShake.withOpacity(0.15),
              borderColor: milkShake.withOpacity(0.65),
              borderStrokeWidth: 2,
            ),]
        ,), siteOrigin: widget.SitePosition, hotelOrSiteMarker: mesHotels,),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.1,
          right: 0,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (initialZoom < 20) {
                      initialZoom = initialZoom + 0.3;
                    }
                  });
                  mapController.move(initialPosition, initialZoom);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    padding: EdgeInsets.all(10),
                    foregroundColor: body,
                    shape: CircleBorder()),
                child: Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (initialZoom > 5) {
                    initialZoom = initialZoom - 0.3;
                      
                    }
                  });
                  mapController.move(initialPosition, initialZoom);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    padding: EdgeInsets.all(10),
                    foregroundColor: body,
                    shape: CircleBorder()),
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    initialPosition = LatLng(_currentPosition.latitude, _currentPosition.longitude);
                                   
                  });
                  print(initialPosition);
                  mapController.move(initialPosition, 15.0); 
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    padding: EdgeInsets.all(10),
                    foregroundColor: body,
                    shape: CircleBorder()),
                child: Icon(Icons.my_location_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }
}