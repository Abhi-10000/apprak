import 'package:flutter/material.dart';
import '../screen2/screen2.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(104, 210, 245, 0.62),
              border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.718)),
            ),
            //height: 60,
            width: double.infinity,
            child: FloatingActionButton(
              child: Text(
                'HomeAuto-AP',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AvailableNetworksScreen()),
                );
              },
            ),
          )),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home, color: Color.fromRGBO(4, 87, 110, 1),),
            tooltip: 'Home-AutoApp',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
