import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_adaptive_navbar_ui/appGlobals.dart';
import 'package:flutter_adaptive_navbar_ui/screens/homeScreen.dart';
import 'package:flutter_adaptive_navbar_ui/screens/messagesScreen.dart';
import 'package:flutter_adaptive_navbar_ui/screens/profileScreen.dart';
import 'package:flutter_adaptive_navbar_ui/widgets/floatingBottomAppBar.dart';
import 'package:flutter_adaptive_navbar_ui/widgets/menuDrawer.dart';
import 'package:flutter_adaptive_navbar_ui/widgets/topAppBar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({ Key? key }) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  String _pageTitle = "Home";
  int _currentPage = 0;
  bool _forceAppMode = false;
  PageController _pageController = PageController(initialPage: 0);

  setAppMode(value){
    setState(() {
      AppGlobals.forceAppMode = value;
      _forceAppMode = value;
    });
  }

  setCurrentPage(pageIndex){
    _currentPage = pageIndex;
    _pageController.jumpToPage(pageIndex);
    _setAppBarTitle(pageIndex);
  }

  void _setAppBarTitle(int pageIndex){
    setState(() {    
      switch(pageIndex){
        case 1:{
          _pageTitle = "Messages";
            break;
        }
        case 2:{
          _pageTitle = "Profile";
          break;
        }
        case 0:
        default:{
          _pageTitle = "Home";
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: TopAppBar(pageTitle: _pageTitle, currentPage: _currentPage, setCurrentPage: setCurrentPage),
      bottomNavigationBar: kIsWeb && !_forceAppMode ? null : FloatingBottomAppBar(currentPage: _currentPage, setCurrentPage: setCurrentPage),
      body: _body(),
      endDrawer: kIsWeb && size.width < 700 && !_forceAppMode ? MenuDrawer(currentPage: _currentPage, setCurrentPage: setCurrentPage,) : null,
    );
  }

  Widget _body(){
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        HomeScreen(setAppMode: setAppMode),
        MessagesScreen(),
        ProfileScreen()
      ],
      onPageChanged: (int pageIndex){
        
      },
    ); 
  }
}