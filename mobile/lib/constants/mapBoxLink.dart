
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';

class AppConstants {
  static String mapBoxAccessToken = dotenv.env['MAPBOX_ACCESS_TOKEN']!;

  static const String urlTemplate = "https://api.mapbox.com/styles/v1/suptec09/clex2ibw300na01msjecmqcqh/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic3VwdGVjMDkiLCJhIjoiY2xmMm1reWR2MDNnbjNzbzFhZjIwaTB3NSJ9.TL3UPen7vN7FX3qrYubBvg";

  static const String mapBoxStyleId = 'Streets';

  static const String mapBoxDarkStyleId = 'Streets dark';

  static final myLocation = LatLng(6.124343, 1.221479);
}
