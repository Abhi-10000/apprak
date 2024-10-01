import 'package:flutter/material.dart';
import '../screen4/screen4.dart';
import '../../models/device_model.dart';

class PinSelectionScreen extends StatefulWidget {
  final Device device;

  PinSelectionScreen({required this.device});

  @override
  _PinSelectionScreenState createState() => _PinSelectionScreenState();
}

class _PinSelectionScreenState extends State<PinSelectionScreen> {
  String _selectedPin = 'Pin1';
  String _pinName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.device.deviceName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Dropdown for selecting PINs
            Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 190, 231, 254),
              border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.718)),
            ),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  DropdownButton<String>(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    //dropdownColor: Color.fromARGB(255, 190, 231, 254),
                    value: _selectedPin,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPin = newValue!;
                      });
                    },
                    items: widget.device.pinAssignments.keys.map((String pin) {
                      return DropdownMenuItem<String>(
                        value: pin,
                        child: Text(pin),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) {
                        setState(() {
                          _pinName = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        widget.device.pinAssignments[_selectedPin] = _pinName;
                      });
                    },
                  ),
                ],
              ),
            ),
            // List of Pins with assignment names
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 190, 231, 254),
              border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.718)),
            ),
                child: ListView(
                  children: widget.device.pinAssignments.keys.map((pin) {
                    return ListTile(
                      title: Text('$pin: ${widget.device.pinAssignments[pin]}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            widget.device.pinAssignments[pin] = 'Unassigned';
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            // Home button
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(device: widget.device),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
