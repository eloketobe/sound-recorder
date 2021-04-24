import 'package:voicerecorder_ui/secondScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ThirdScreen extends StatefulWidget {
  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  int _currentIndex = 0; //for navigation bar

  // void onTappedBar(int index){
  //setState(() {
  //_currentIndex = index;
  //});

  // Timer _timer;
  //String greeting = "";

  @override
  Widget build(BuildContext context) {
    //void initState(){
    //super.initState();
    //_timer = Timer.periodic(Duration(seconds: 1), (timer){
    //setState(() {
    //greeting = "Timer ${DateTime.now().second}";
    //});
    //});

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Playback'),
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrangeAccent.shade700.withOpacity(0.3),
                ),
                child: RawMaterialButton(
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(30),
                  onPressed: () {
                    //_timer.cancel();
                  },
                  child: Icon(Icons.mic, color: Colors.redAccent, size: 50),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },

          //onTap: onTappedBar,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.red,
              ),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pause,
                color: Colors.red,
              ),
              label: 'Pause',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.stop,
                color: Colors.red,
              ),
              label: 'Stop',
            ),
          ],
        ),
      ),
    );
  }
}
