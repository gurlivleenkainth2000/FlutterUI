import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_fonts/google_fonts.dart';

fetchCurrentLocation() async {
  Location _location = new Location();
  PermissionStatus _permissionStatus;
  bool _serviceEnabled;

  LocationData _locationData;
  _serviceEnabled = await _location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await _location.requestService();
    if(!_serviceEnabled) {
      return;
    }
  }

  if(_permissionStatus == PermissionStatus.denied) {
    _permissionStatus = await _location.requestPermission();
    if(_permissionStatus != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await _location.getLocation();
  return _locationData;
}

fetchUserAddress(Coordinates coordinates) async {
  var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  return address.first;
}

class UserAddressPage extends StatefulWidget {
  @override
  _UserAddressPageState createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  LocationData locationData;
  String mainAddress = "Not Known";
  String longitude = "Not Known";
  String latitude = "Not Known";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Location', style: Theme.of(context).textTheme.headline1,),
              RichText(
                text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Latitude: \t',
                      style: GoogleFonts.openSans(fontSize: 18.0,color: Colors.grey[600],)
                  ),
                  TextSpan(
                      text: latitude,
                      style: GoogleFonts.openSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]
                      )
                  ),
                ]),
              ),
              RichText(
                text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Longitude: \t',
                      style: GoogleFonts.openSans(fontSize: 18.0,color: Colors.grey[600],)
                  ),
                  TextSpan(
                      text: longitude,
                      style: GoogleFonts.openSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]
                      )
                  ),
                ]),
              ),
              RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Address: \t',
                          style: GoogleFonts.openSans(fontSize: 18.0,color: Colors.grey[600],)
                      ),
                      TextSpan(
                          text: mainAddress,
                          style: GoogleFonts.openSans(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]
                          )
                      ),
                    ]),
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.teal[300],
        child: Icon(Icons.my_location_sharp, size: 38,),
        tooltip: 'Get Current Location',
        onPressed: () async {
          locationData = await fetchCurrentLocation();
          Coordinates coordinates = new Coordinates(locationData.latitude, locationData.longitude);
          Address address = await fetchUserAddress(coordinates);
          print(">>> " + address.toString());
          setState(() {
            longitude = locationData.longitude.toString();
            latitude = locationData.latitude.toString();
            mainAddress = address.addressLine.toString();
          });
        },
      ),
    );
  }
}
