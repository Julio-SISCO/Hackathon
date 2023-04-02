import 'package:latlong2/latlong.dart';

class Site {
 final int id;
  final String name;
  final String image;
  final double likes;
  final LatLng location;

  Site({required this.name, required this.id, required this.image, required this.likes, required this.location});

}