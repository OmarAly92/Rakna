import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rakna/core/services/location_sevices.dart';

import '../components/polyline_services.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();


}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(33.515343, 36.289590),
    zoom: 14.4746,
  );

  LatLng currentLocation = _initialCameraPosition.target;

  BitmapDescriptor? _locationIcon;
  Set<Marker> _markers = {};

  Set<Polyline> _polylines = {};
  @override
  void initState() {
    _buildMarkerFromAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
            markers: _markers,
            polylines: _polylines,
            onCameraMove: (position) {
              setState(() {
                currentLocation = position.target;
              });
            },
          ),
          SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/location_marker.png'),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _drawPolyline(LatLng(38.52900208591146,-98.54919254779816),currentLocation),
            child: Icon(Icons.settings_ethernet_rounded),
          ),
          SizedBox(
            height: 10.h,
          ),
          FloatingActionButton(
            onPressed: () => _setMarker(currentLocation),
            child: Icon(Icons.location_on),
          ),
          SizedBox(
            height: 10.h,
          ),
          FloatingActionButton(
            onPressed: () => _getMyLocation(),
            child: Icon(Icons.gps_fixed),
          ),
        ],
      ),
    );
  }


  Future<void> _drawPolyline(LatLng from, LatLng to) async {
    Polyline polyline = await PolylineService().drawPolyline(from, to);

    _polylines.add(polyline);

    _setMarker(from);
    _setMarker(to);

    setState(() {});
  }

  void _setMarker(LatLng _location) {
    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: _location,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${currentLocation.latitude}, ${currentLocation.longitude}"),
    );
    _markers.add(newMarker);
    setState(() {});
  }

  Future<void> _buildMarkerFromAssets() async {
    if (_locationIcon == null) {
      _locationIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(48, 48)),
          'assets/images/location_icon.png');
      setState(() {});
    }
  }

  Future<void> _getMyLocation() async {
    LocationData _myLocation = await LocationServices().getLocation();
    _animateCamera(LatLng(_myLocation.latitude!, _myLocation.longitude!));
  }


  Future<void> _animateCamera(LatLng _location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 13.00,
    );
    print(
        "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
}