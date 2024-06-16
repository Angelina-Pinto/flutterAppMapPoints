import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_points/src/models/position.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiYXBpbnRvNyIsImEiOiJjbHhkdnQ2ZnYwYXhqMnFvdmJlZG9va3Y3In0.0PZU4RBLEl4W16Fxqksf0g';
const MAPBOX_STYLE = 'mapbox/outdoors-v12';

final pos = LatLng(14.4887947, -90.5809932);

final objpos1 = Position(lat: 14.52516, lon:  -90.56036);
final objpos2 = Position(lat: 14.52477, lon: -90.56107);
final objpos3 = Position(lat: 14.5245, lon: -90.56142);
final objpos4 = Position(lat: 14.52429, lon:  -90.5617);
final objpos5 = Position(lat: 14.52411, lon:  -90.56193);
final objpos6 = Position(lat: 14.5237, lon: -90.56249);
final objpos7 = Position(lat: 14.5235, lon: -90.56271);
final objpos8 = Position(lat: 14.52328, lon: -90.56307);
final objpos9 = Position(lat: 14.52291, lon: 90.56334);
final objpos10 = Position(lat: 14.5224, lon: -90.56354);
final objpos11 = Position(lat: 14.52182, lon:  -90.56368);
final objpos12 = Position(lat: 14.52108, lon:  -90.56378);
final objpos13 = Position(lat: 14.51984, lon: -90.56388);
final objpos14 = Position(lat: 14.51867, lon: -90.56411);
final objpos15 = Position(lat: 14.5156, lon: -90.56391);


final List<Position> list_pos = [objpos1, objpos2, objpos3, objpos4, objpos5, objpos6, objpos7, objpos8, objpos9, objpos9, objpos10
,objpos11, objpos12, objpos13, objpos14, objpos15];

class FlutterScreenMap extends StatelessWidget {
  const FlutterScreenMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: FlutterMap(
              options: MapOptions(
                center: pos,
                zoom: 10,
                minZoom: 5,
                maxZoom: 25,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/$MAPBOX_STYLE/tiles/{z}/{x}/{y}?access_token=$MAPBOX_ACCESS_TOKEN",
                  additionalOptions: {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': MAPBOX_STYLE,
                  },
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: list_pos.map((position) {
                    return Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(position.lat, position.lon),
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.0,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: list_pos.length,
              itemBuilder: (context, index) {
                final position = list_pos[index];
                return ListTile(
                  title: Text(
                    'Posición ${index + 1}: (${position.lat}, ${position.lon})',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FlutterScreenMap(),
  ));
}
