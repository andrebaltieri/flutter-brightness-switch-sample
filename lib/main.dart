import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var theme = darkTheme;

var darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var lightTheme = ThemeData(
  primarySwatch: Colors.green,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    changeTheme();
  }

  changeTheme() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    brightness == Brightness.dark ? theme = darkTheme : theme = lightTheme;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Themes',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Themes"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
