import 'package:flutter/material.dart';
import 'package:mapbox_polyline_points/mapbox_polyline_points.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_points/src/models/position.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiYXBpbnRvNyIsImEiOiJjbHhkdnQ2ZnYwYXhqMnFvdmJlZG9va3Y3In0.0PZU4RBLEl4W16Fxqksf0g';
//const MAPBOX_STYLE = 'mapbox/streets-v11';
const MAPBOX_STYLE = 'mapbox/outdoors-v12';

final pos = LatLng(14.521457, -90.5668893);

//final List<String> abilities = [’listado’]

final objpos1 = new Position(lat: 14.521457, lon: -90.5668893);
final objpos2 = new Position(lat: 14.5215417, lon: -90.6055141);
final objpos3 = new Position(lat: 14.614528, lon: -90.5183232);
final objpos4 = new Position(lat: 14.614528, lon: -90.5183232);


final List<Position> list_pos = [objpos1, objpos2, objpos3, objpos4];

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
              options: MapOptions(center: pos,zoom: 10,minZoom: 5,maxZoom: 25,
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
                
              ],
              
              nonRotatedChildren: [
            
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: pos,
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
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
                  }
            )
          )
        ],
      ),
    );
  }
}



