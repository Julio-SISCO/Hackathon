import 'package:latlong2/latlong.dart';

abstract class Point {
  final int id;
  final String name;
  final String image;
  final double ratingOrLike;
  final LatLng location;

  Point({ required this.id, required  this.name, required  this.image, required  this.ratingOrLike, required  this.location});

}