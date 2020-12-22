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

fetchUserAddress() async {
  LocationData locationData = await fetchCurrentLocation();
  Coordinates coordinates = new Coordinates(locationData.latitude, locationData.longitude);
  var address = (await Geocoder.local.findAddressesFromCoordinates(coordinates)).first;
  var userAddressObject = {
    'addressLine': address.addressLine,
    'city': address.locality,
    'countryCode': address.countryCode,
    'countryName': address.countryName,
    'featureName': address.featureName,
    'state': address.adminArea,
    'locationCoordinates': address.coordinates.toMap(),
    'postalCode': address.postalCode,
  };
  print(">>> User Address: " + userAddressObject.toString());
  return userAddressObject;
  // return address.first;
}

class UserAddressPage extends StatefulWidget {
  @override
  _UserAddressPageState createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  double _longitude, _latitude;
  String _postalCode;
  String _address = '', _countryName, _countryCode, _state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3C51),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff2F3C51),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Your",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        )),
                    TextSpan(
                        text: "\nLocation",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold))
                  ]),
                ),
              ),
            ),
            Positioned(
              top: 130,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 60, 8, 0),
                  child: Column(
                    children: <Widget>[
                    Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Full Address:\n",
                              style: TextStyle(
                                color: Color(0xff2F3C51),
                                fontSize: 17,
                              )),
                          _address != ''
                              ? TextSpan(
                              text: "$_address",
                              style: TextStyle(
                                  color: Color(0xff2F3C51),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))
                              : TextSpan(
                              text:
                              "Tap icon to access your location",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic)),
                        ]),
                      ),
                    ),
                  ),
                    SizedBox(height: 6,),
                    Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Coordinates (longitude and latitude):\n",
                                style: TextStyle(
                                  color: Color(0xff2F3C51),
                                  fontSize: 17,
                                )),
                            _latitude != null && _longitude != null
                                ? TextSpan(
                                text: "$_longitude, $_latitude",
                                style: TextStyle(
                                    color: Color(0xff2F3C51),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                                : TextSpan(
                                text:
                                "Tap icon to access your location",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic)),
                          ]),
                        ),
                      ),
                  ),
                    SizedBox(height: 6,),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Postal Code:\n",
                                style: TextStyle(
                                  color: Color(0xff2F3C51),
                                  fontSize: 17,
                                )),
                            _postalCode != null
                                ? TextSpan(
                                text: "$_postalCode",
                                style: TextStyle(
                                    color: Color(0xff2F3C51),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                                : TextSpan(
                                text:
                                "Tap icon to access your location",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic)),
                          ]),
                        ),
                      ),
                  ),
                    SizedBox(height: 6,),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "State:\n",
                                style: TextStyle(
                                  color: Color(0xff2F3C51),
                                  fontSize: 17,
                                )),
                            _state != null
                                ? TextSpan(
                                text: "$_state",
                                style: TextStyle(
                                    color: Color(0xff2F3C51),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                                : TextSpan(
                                text:
                                "Tap icon to access your location",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic)),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 6,),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Country:\n",
                                style: TextStyle(
                                  color: Color(0xff2F3C51),
                                  fontSize: 17,
                                )),
                            _countryName != null
                                ? TextSpan(
                                text: "$_countryName ($_countryCode)",
                                style: TextStyle(
                                    color: Color(0xff2F3C51),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                                : TextSpan(
                                text:
                                "Tap icon to access your location",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic)),
                          ]),
                        ),
                      ),
                  ),
                ]),
              ),
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2F3C51),
        splashColor: Colors.teal[300],
        child: Icon(Icons.my_location_sharp, size: 38, color: Colors.white,),
        tooltip: 'Get Current Location',
        onPressed: () async{
          var address = await fetchUserAddress();
          setState(() {
            _address = address['addressLine'];
            _longitude = address['locationCoordinates']['longitude'];
            _latitude = address['locationCoordinates']['latitude'];
            _postalCode = address['postalCode'];
            _countryName = address['countryName'];
            _countryCode = address['countryCode'];
            _state = address['state'];
          });
        },
      ),
    );
  }
}
