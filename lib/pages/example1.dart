import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('titulo'),
          actions: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '1/12',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        body: PrimeraImagen());
  }
}

// class PlatoImagen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(50),
//       child: Stack(
//         children: <Widget>[
//           // Positioned(
//           //   top: 0,
//           //   right: 0,
//           //   child: Image(
//           //     image: AssetImage('assets/img.png'),
//           //   ),
//           // )
//           Positioned(
//             top: 0,
//             right: 0,
//             width: 150.0,
//             child: Image(
//               image: AssetImage('assets/img.png'),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             width: 150.0,
//             child: Image(
//               image: AssetImage('assets/img.png'),
//             ),
//           ),

//         ],
//       ),
//     );
//   }
// }

class PrimeraImagen extends StatefulWidget {
  @override
  _PrimeraImagenState createState() => _PrimeraImagenState();
}

class _PrimeraImagenState extends State<PrimeraImagen> {
  double firstImage = 150.0;
  double secondImage = 150.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Stack(
              children: <Widget>[
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: firstImage),
                  duration: const Duration(seconds: 1),
                  builder: (BuildContext context, double size, Widget? child) {
                    return Positioned(
                      top: 0,
                      right: 0,
                      width: size,
                      child: child!,
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/img.png'),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: secondImage),
                  duration: const Duration(seconds: 1),
                  builder: (BuildContext context, double size, Widget? child) {
                    return Positioned(
                      bottom: 0,
                      left: 0,
                      width: size,
                      child: child!,
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/img.png'),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: ListView(
              children: [
                IconButton(
                  icon: Icon(Icons.audiotrack),
                  onPressed: () {
                    setState(() {
                      firstImage = 250.0;
                      secondImage = 50.0;
                    });
                    AudioCache player = AudioCache(prefix: 'assets/');
                    player.play('dado.mp3');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.audiotrack),
                  onPressed: () {
                    setState(() {
                      firstImage = 50.0;
                      secondImage = 250.0;
                    });
                    AudioCache player = AudioCache(prefix: 'assets/');
                    player.play('dado.mp3');
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
