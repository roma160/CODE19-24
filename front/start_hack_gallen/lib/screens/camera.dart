import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class CameraInput extends StatefulWidget {
  const CameraInput({super.key});

  @override
  State<CameraInput> createState() => _CameraInputState();
}

class _CameraInputState extends State<CameraInput> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      backgroundColor: const Color.fromARGB(255, 8, 98, 23),
      child: const Icon(Icons.camera),
      onPressed: () async {
        final imagePicker = ImagePicker();
        final file = await imagePicker.pickImage(source: ImageSource.camera);
        // await showDialog(
        //     context: context,
        //     builder: (context) {
        //       return const Padding(
        //         padding: EdgeInsets.all(40.0),
        //         child: CircularProgressIndicator(),
        //       );
        //     });
        Location location = Location();

        bool _serviceEnabled;
        PermissionStatus _permissionGranted;
        LocationData _locationData;

        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            return;
          }
        }

        _locationData = await location.getLocation();
        print(_locationData.longitude);

        if (file == null) {
          return;
        }
        final readyFile = File(file.path);
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('https://code1924.azurewebsites.net/image/upload'),
        );
        final image =
            await http.MultipartFile.fromPath('image', readyFile.path);
        request.files.add(image);
        request.headers["Lat"] = _locationData.latitude.toString();
        request.headers["Lon"] = _locationData.latitude.toString();

        // final jsonData = jsonEncode(
        //     {"Lon": _locationData.longitude, "Lat": _locationData.latitude});
        // request.fields['data'] = jsonData;

// Send the request (no need to add location data to headers)
        final resp = await request.send();
        final response = await http.Response.fromStream(resp);
// ... (check response status code and handle success/error)
        print(response.headers);

        if (response.statusCode == 200) {
          print("Image uploaded");
          print(response.body);
        } else {
          print("Image denied");
          print(response.body);
          print(response.statusCode);
        }
      },
    );
  }
}
