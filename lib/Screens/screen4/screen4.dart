import 'package:apprak/Screens/screen1/screen1.dart';
import 'package:flutter/material.dart';
import '../screen3/screen3.dart';
import '../../models/device_model.dart';

class HomeScreen extends StatefulWidget {
  final Device device;

  HomeScreen({required this.device});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Keep a map to track the switch states independently
  Map<String, bool> _toggleStates = {};

  @override
  void initState() {
    super.initState();
    // Initialize toggle states for all pins, independent of assignment
    _toggleStates = {
      for (var pin in widget.device.pinAssignments.keys) pin: false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: ListView(
        children: [
          // Dropdown for the device and assigned pins
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(196, 235, 248, 0.62),
              border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.718)),
            ),
            child: ExpansionTile(
              title: Text(widget.device.deviceName),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PinSelectionScreen(device: widget.device),
                        ),
                      );
                    },
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              children: widget.device.pinAssignments.keys.map((pin) {
                return ListTile(
                  title: Row(
                    children: [
                      // Display the pin name and assignment
                      Text('$pin: ${widget.device.pinAssignments[pin]}'),
                      Spacer(),
                      // Independent toggle switch for each pin
                      Switch(
                        activeColor: const Color.fromARGB(255, 255, 255, 255),
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Colors.white,
                        inactiveThumbColor: Colors.black,
                        value: _toggleStates[pin]!,
                        onChanged: (value) {
                          setState(() {
                            _toggleStates[pin] = value; // Toggle state changed
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [

              IconButton(
                icon: Icon(Icons.login, color: Color.fromRGBO(4, 87, 110, 1),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscoverScreen(),
                    ),
                  );
                },
              ),
        ]),
        ],
        
      ),
    );
  }
}
