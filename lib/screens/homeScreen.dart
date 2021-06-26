import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_adaptive_navbar_ui/appGlobals.dart';

class HomeScreen extends StatefulWidget {
  final setAppMode;
  const HomeScreen({ Key? key, this.setAppMode }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kIsWeb ? _appModeButton() : Container()
          ],
        )
      )
    );
  }

  Widget _appModeButton(){
    return Container(
      width: 250,
      height: 50,
      child: TextButton(
        child: Text(
          AppGlobals.forceAppMode ? "Change to web mode" : "Change to app mode",
          style: TextStyle(
            color: Theme.of(context).primaryColor
          ),
        ),
        onPressed: () {
          setState(() {          
            var isAppMode = AppGlobals.forceAppMode ? false : true;
            this.widget.setAppMode(isAppMode);
          });
        }
      ),
    );
  }
}