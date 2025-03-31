import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:MoistMeter/components/navbar.dart';





class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapboxMap mapboxMap;
  PointAnnotationManager? pointAnnotationManager;

  @override
  void initState() {
    super.initState();
    setSystemUIOverlayStyle(context);
  }

  @override
  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    pointAnnotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    // Load the image from assets
    final ByteData bytes =
        await rootBundle.load('assets/images/icons/marker.png');
    final Uint8List imageData = bytes.buffer.asUint8List();

    // Create a PointAnnotationOptions
    List<PointAnnotationOptions> points = [
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(152.218234, -27.609226)), // Example coordinates
        image: imageData,
        iconSize: 3.0,
      ),
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(152.220000, -27.610000)), // Example coordinates
        image: imageData,
        iconSize: 3.0,
      ),
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(152.215000, -27.608000)), // Example coordinates
        image: imageData,
        iconSize: 3.0,
      ),
    ];

    // Add the annotation to the map
    pointAnnotationManager?.createMulti(points);
  }


  


  void setSystemUIOverlayStyle(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, 
        statusBarColor: Colors.transparent, 
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Navbar(selectedIndex: 1),
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Theme.of(context).colorScheme.surface,  //surface
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.pin_drop_rounded,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Lockyer Valley, QLD',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Text('Map goes here'),
            ),
            MapWidget(
                cameraOptions: CameraOptions(
                  center: Point(coordinates: Position(152.218234, -27.609226)),
                  zoom: 15,
                  bearing: 0,
                  pitch: 45,
                ),
                onMapCreated: _onMapCreated,
              ),
          ],
        ),
      ),
    );
  }
 
}