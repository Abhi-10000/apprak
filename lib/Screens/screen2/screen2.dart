import 'package:flutter/material.dart';
import '../screen3/screen3.dart';
import '../../models/device_model.dart';

class AvailableNetworksScreen extends StatefulWidget {
  @override
  _AvailableNetworksScreenState createState() =>
      _AvailableNetworksScreenState();
}

class _AvailableNetworksScreenState extends State<AvailableNetworksScreen> {
  String _ssid = '';
  String _password = '';
  String _deviceName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Networks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Networks (simulated)
            Expanded(
              child: Container(
                //color: Color.fromRGBO(104, 210, 245, 0.62),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 166, 221, 252),
                  border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.718)),
                ),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Home Wifi'),
                      leading: Icon(
                        Icons.wifi,
                        color: Color.fromRGBO(4, 87, 110, 1),
                      ),
                    ),
                    ListTile(
                      title: Text('Office Wifi'),
                      leading: Icon(
                        Icons.wifi,
                        color: Color.fromRGBO(4, 87, 110, 1),
                      ),
                    ),
                    ListTile(
                      title: Text('Public Wifi'),
                      leading: Icon(
                        Icons.wifi,
                        color: Color.fromRGBO(4, 87, 110, 1),
                      ),
                    ),
                    ListTile(
                      title: Text('Private Wifi'),
                      leading: Icon(
                        Icons.wifi,
                        color: Color.fromRGBO(4, 87, 110, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SSID and Password Input
            TextField(
              decoration: InputDecoration(
                  labelText: 'SSID',
                  hintText: 'Enter the ssid',
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 55, 57, 59),
                      fontWeight: FontWeight.normal)),
              onChanged: (value) {
                setState(() {
                  _ssid = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter the password',
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 57, 59, 61),
                      fontWeight: FontWeight.normal)),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Device Name',
                  hintText: 'Enter the devicename',
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 62, 65, 67),
                      fontWeight: FontWeight.normal)),
              onChanged: (value) {
                setState(() {
                  _deviceName = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Device device = Device(
                  ssid: _ssid,
                  password: _password,
                  deviceName: _deviceName,
                  pinAssignments: {
                    'Pin1': 'Unassigned',
                    'Pin2': 'Unassigned',
                    'Pin3': 'Unassigned',
                  },
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinSelectionScreen(device: device),
                  ),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
