import 'package:flutter/material.dart';
import 'package:cocina/pages/tween_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: List(
              onItemTap: _onItemTap,
            ),
            key: ValueKey("List"),
          ),
          if (currentItem != null)
            MaterialPage(
              child: Page(currentItem),
              key: ValueKey(currentItem),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          setState(() {
            currentItem = null;
          });

          return true;
        },
      ),
    );
  }

  _onItemTap(String item) {
    setState(() {
      currentItem = item;
    });
  }
}

class List extends StatelessWidget {
  final Function(String) onItemTap;
  const List({Key key, @required this.onItemTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('titulo'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              onTap: () {
                onItemTap("titulo $index");
              },
              leading: Icon(Icons.sanitizer),
              title: Text("titulo $index"),
              trailing: Icon(Icons.arrow_right_alt_rounded),
            );
          },
        ));
  }
}

class Page extends StatelessWidget {
  final String titulo;
  const Page(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            const SizedBox(width: 15),
            TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                tween: Tween<double>(begin: 0, end: 2),
                builder: (context, double angle, _) {
                  return Transform.rotate(
                    angle: angle,
                    child: Icon(Icons.access_alarm_outlined),
                  );
                }),
            const SizedBox(width: 15),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              curve: Curves.bounceOut,
              child: Text("titulo de las comidas"),
              duration: const Duration(milliseconds: 700),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, 300 * value),
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
