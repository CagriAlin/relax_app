import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:relax_app/kConstant.dart';
import 'package:relax_app/screens/homepage.dart';


void main() => runApp(
      DevicePreview(
        enabled: true , //!kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: DevicePreview.appBuilder, // <--- Add the builder
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          Homepage.routeName: (BuildContext ctx) => Homepage(),
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: kGreenBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.60,
                child: Hero(
                  tag: 'picto',
                  child: Image.asset('assets/picto.png'),
                ),
              ),
            ),
            Center(
                child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Rahatlamak",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),

                  TextSpan(
                      text: "İster misin?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold))
                ],
              ),
                  textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                for(int i = 0; i < 3; i++) {
                  kSentences.shuffle();
                  finalSentences.add(kSentences.first);
                  kSentences.removeAt(0);
                }
                Navigator.of(context).pushNamed(Homepage.routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                padding: EdgeInsets.all(15),
                child: Text(
                  "Evet",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}