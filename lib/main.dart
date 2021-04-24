import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:voicerecorder_ui/secondScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with SingleTickerProviderStateMixin {
  final double _textVerticalDisplacement = 100;
  final int _translationAnimationDuration = 2;
  final int _opacityAnimationDuration = 3;
  final int _postAnimationNavigationDelayDuration = 2;

  AnimationController _animationController;
  double _textOpacity = 0.0;


//   @override
// void initState(){
//     super.initState();
//     Timer(Duration(seconds: 10),
//             ()=>Navigator.push(
//                 context, MaterialPageRoute(
//                 builder: (context)=>SecondScreen()))
//     );
// }
//

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateAppTitle();
    });

    final List<int> _animationDurationList = [
      _translationAnimationDuration,
      _opacityAnimationDuration
    ];
    _animationDurationList.sort();

    final int _highestAnimationDuration = _animationDurationList.last;
    final int _delayDurationBeforeNavigation =
        _highestAnimationDuration + _postAnimationNavigationDelayDuration;

    Future.delayed(Duration(seconds: _delayDurationBeforeNavigation), () {
      Navigator.pushReplacement(context, MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SecondScreen();
        },
      ));
    });
  }

  void _animateAppTitle() {
    setState(() {
      _textOpacity = 1.0;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/audio2.png',
              height: 200.0,
            ),
            SizedBox(height: 30.0),
            SpinKitWave(color: Colors.red,),
            Text(
              'GROUP FIVE',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
      ),
    );
  }
}

