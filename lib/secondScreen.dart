import 'dart:async';

import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voicerecorder_ui/thirdScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  static const duration = const Duration(milliseconds: 3);
  int miliSecondsPassed = 0;
  bool isActive = false;
  int _currentIndex = 0;
  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        miliSecondsPassed = miliSecondsPassed + 1;
      });
    }
  }

  // void onTappedItem(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    timer ??= Timer.periodic(duration, (Timer t) {
      handleTick();
    });

    int miliSec = miliSecondsPassed % 100;
    int seconds = (miliSecondsPassed ~/ 100);
    int minutes = miliSecondsPassed ~/ (60 * 100);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Voice Recorder'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Row(
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
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                    child: Icon(Icons.mic, color: Colors.redAccent, size: 50),
                  ),
                ),
              ],
            ),
            AudioWave(
              height: 140,
              width: 140,
              spacing: 2.5,
              bars: [
                AudioWaveBar(height: 10, color: Colors.deepOrangeAccent),
                AudioWaveBar(height: 30, color: Colors.redAccent),
                AudioWaveBar(height: 70, color: Colors.red),
                AudioWaveBar(height: 40),
                AudioWaveBar(height: 20, color: Colors.orange),
                AudioWaveBar(height: 10, color: Colors.deepOrangeAccent),
                AudioWaveBar(height: 30, color: Colors.redAccent),
                AudioWaveBar(height: 70, color: Colors.red),
                AudioWaveBar(height: 40),
                AudioWaveBar(height: 20, color: Colors.orange),
                AudioWaveBar(height: 10, color: Colors.deepOrangeAccent),
                AudioWaveBar(height: 30, color: Colors.redAccent),
                AudioWaveBar(height: 70, color: Colors.red),
                AudioWaveBar(height: 40),
                AudioWaveBar(height: 20, color: Colors.orange),
                AudioWaveBar(height: 10, color: Colors.deepOrangeAccent),
                AudioWaveBar(height: 30, color: Colors.redAccent),
                AudioWaveBar(height: 70, color: Colors.red),
                AudioWaveBar(height: 40),
                AudioWaveBar(height: 20, color: Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LabelText(
                    label: "MIN", value: minutes.toString().padLeft(2, '0')),
                LabelText(
                    label: "SEC", value: seconds.toString().padLeft(2, '0')),
                LabelText(
                    label: "MILLISEC",
                    value: miliSec.toString().padLeft(2, '0')),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                width: 100,
                height: 47,
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'STOP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white54),
                  ),
                  onPressed: () {
                    setState(() {
                      isActive = false;

                      miliSecondsPassed = 0;
                    });
                  },
                ),
              ),

              //   Container(
              //   width: 200,
              //   height: 47,
              //   margin: EdgeInsets.only(top: 30),
              //   child: RaisedButton(
              //     color: Colors.red,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25)),
              //     child: Text(
              //       isActive ? 'PAUSE' : 'RECORD',
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 25,
              //           color: Colors.white54),
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         isActive = !isActive;
              //         if (isActive == false) {
              //           _currentIndex = 2;
              //         } else
              //           _currentIndex = 1;
              //       });
              //     },
              //   ),
              // ),

              SizedBox(
                width: 30,
              ),

              Container(
                width: 100,
                height: 47,
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  color: Colors.lightGreenAccent,
                  child: Text(
                    'PLAY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white54),
                  ),
                  onPressed: () {
                    setState(() {
                      isActive = false;

                      miliSecondsPassed = 0;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()));
                  },
                ),
              )
            ]),
          ]),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   type: BottomNavigationBarType.shifting,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.stop,
        //       ),
        //       label: 'Stopped',
        //       backgroundColor: Colors.blueAccent,
        //     ),
        //
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.fiber_manual_record,
        //       ),
        //       label: 'Recording',
        //       backgroundColor: Colors.redAccent,
        //     ),
        //
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.pause,
        //       ),
        //       label: 'Paused',
        //       backgroundColor: Colors.black45,
        //     ),
        //
        //   ],
        //
        //   //    onTap:(index){
        //   //   setState(() {
        //   //     _currentIndex = index;
        //   //
        //   //   });
        //   //
        //   // // Navigator.pop(
        //   // // context, MaterialPageRoute(
        //   // //   builder: (context)=>SecondScreen()));
        //   //    }
        // ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontSize: 55, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
          ),
        )
      ]),
    );
  }
}
