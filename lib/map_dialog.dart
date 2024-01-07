import 'package:financeiro/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDialog extends StatelessWidget {
  final String tittle;
  final String? description;
  final double lat;
  final double lng;

  const MapDialog({
    super.key,
    required this.tittle,
    this.description,
    required this.lat,
    required this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            tittle,
            textAlign: TextAlign.center,
            style: StyleCustom.subTittle,
          ),
          if (description != null)
            Text(
              description!,
              textAlign: TextAlign.center,
              style: StyleCustom.body,
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(lat, lng),
                  initialZoom: 16.5,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(lat, lng),
                        width: 46,
                        height: 46,
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            width: 46,
                            height: 46,
                            child: Icon(
                              Icons.location_on_rounded,
                              size: 46,
                              color: StyleCustom.iconColor,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 46,
                            height: 46,
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 46,
                              color: StyleCustom.iconColor,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 46,
                            height: 46,
                            child: Icon(
                              Icons.location_on_rounded,
                              size: 40,
                              color: Colors.amberAccent,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  /* RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => print('h'),
                        ),
                      ],
                    ), */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
