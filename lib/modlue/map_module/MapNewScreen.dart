import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../view_model/cubit/location_cubit/location_cubit.dart';
import '../../views/componants/custom_snack_bar/custom_snack_bar.dart';

class MapNewScreen extends StatefulWidget {
  const MapNewScreen({
    this.color = Colors.blue,
    required this.onPicked,
  });

  final Color color;
  final Function onPicked;

  @override
  State<MapNewScreen> createState() => _MapNewScreenState();
}

class _MapNewScreenState extends State<MapNewScreen> {
  late MapController _mapController;

  String? address;
  TextEditingController _searchController = TextEditingController();
  bool loading = false;

  Future<String> getAddress(double lat, double lng) async {
    setState(() {
      loading = true;
    });
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(lat, lng, localeIdentifier: "ar_EG");
    print(placemarks);
    geo.Placemark place = placemarks[0];
    address =
        "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    setState(() {
      loading = false;
    });
    print(address);

    widget.onPicked(lat, lng, address!);

    return "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
  }

  Future<void> searchLocation(String text) async {
    List<geo.Location> locations = await geo.locationFromAddress(text);
    if (locations != null && locations.isNotEmpty) {
      print(locations);
      geo.Location location = locations.first;
      LatLng latLng = LatLng(location.latitude, location.longitude);
      _mapController.move(LatLng(latLng.latitude, latLng.longitude), 14);
      buildMark(latLng.latitude, latLng.longitude);
    }
  }

  @override
  void initState() {
    _mapController = MapController();
    super.initState();
    _onMapCreated(_mapController);
    getLocation(_mapController);
  }

  Future<void> _onMapCreated(MapController controller) async {
    _mapController = controller;
  }

  Future<void> getLocation(MapController controller) async {
    context.read<LocationCubit>().getLocation();
  }

  Marker buildMark(double lat, double lng) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(lat, lng),
      builder: (ctx) => Container(
        width: 80.0,
        height: 80.0,
        child: Icon(
          Icons.location_on,
          color: widget.color,
          size: 40,
        ),
      ),
    );
  }

  LatLng? _lastMapPosition;

  LatLng? currentUserLocation;

  List<Marker> markers = [];
  double zoom = 14;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getLocation(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) async {
          if (State is LocationPermissionGranted) {
            await context.read<LocationCubit>().getAddresss();
            buildMark(
                currentUserLocation!.latitude, currentUserLocation!.longitude);
          } else if (state is LocationError) {
            customSnackBar(
                message: "Please Ensure You Give Access To Get Location",
                snackBarType: SnackBarType.error,
                context: context);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: widget.color,
              title: const Text("قم بتحديد الموقع "),
            ),
            body: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    boundsOptions:
                        const FitBoundsOptions(padding: EdgeInsets.all(8.0)),
                    onTap: (tapPosition, point) {
                      setState(() {
                        markers.clear();
                        markers.add(
                          buildMark(point.latitude, point.longitude),
                        );
                      });

                      _lastMapPosition = point;
                      print('User tapped at: $point');
                      getAddress(point.latitude, point.longitude).then((value) {
                        print(value);
                      }).catchError((e) {
                        print(e);
                      });
                    },
                    center: _lastMapPosition ?? currentUserLocation,
                    zoom: zoom,
                    onMapReady: () {
                      context.read<LocationCubit>().getLocation();
                      context.read<LocationCubit>().getAddresss();
                      _mapController.move(
                          LatLng(
                              context
                                  .read<LocationCubit>()
                                  .locationData!
                                  .latitude!,
                              context
                                  .read<LocationCubit>()
                                  .locationData!
                                  .longitude!),
                          14);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 22,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          //   setState(() {
                          // markers.clear();
                          // markers.add(
                          // buildMark(currentUserLocation.latitude, currentUserLocation.longitude),
                          //
                          // );
                          //     _mapController.move(
                          //         currentUserLocation==null ? LatLng(51.5, -0.09) :
                          //         currentUserLocation, 14);
                          //   });
                          //   getAddress(currentUserLocation.latitude, currentUserLocation.longitude).then((value)
                          //   {
                          //     print(value);
                          //   });
                          _lastMapPosition = currentUserLocation;
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: widget.color,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.location_searching_sharp,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            zoom++;
                            _mapController.move(
                                _lastMapPosition == null
                                    ? LatLng(51.5, -0.09)
                                    : _lastMapPosition!,
                                zoom);
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: widget.color,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print("Amr");
                          setState(() {
                            zoom--;
                            _mapController.move(
                                _lastMapPosition == null
                                    ? LatLng(51.5, -0.09)
                                    : _lastMapPosition!,
                                zoom);
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: widget.color,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.zoom_out,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onEditingComplete: () {
                            searchLocation(_searchController.text);
                          },
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  right: 100,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      // width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "العنوان",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          loading
                              ? Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    address ?? "لايوجد",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ],
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
