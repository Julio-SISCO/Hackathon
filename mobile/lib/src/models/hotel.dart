import 'package:latlong2/latlong.dart';

class Hotel {
  final int id;
  final String name;
  final String image;
  final double rating;
  final LatLng location;

  Hotel({required this.name, required this.id, required this.image, required this.rating, required this.location});
}

