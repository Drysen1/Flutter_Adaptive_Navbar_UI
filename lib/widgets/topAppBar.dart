import 'package:flutter/material.dart';
import 'package:flutter_adaptive_navbar_ui/appGlobals.dart';
import 'package:flutter_adaptive_navbar_ui/widgets/fullNavbarItem.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String pageTitle;
  final int currentPage;
  final setCurrentPage;
  const TopAppBar({ Key? key, required this.pageTitle, required this.currentPage, this.setCurrentPage }) : super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();

  @override
  Size get preferredSize => kIsWeb ? Size.fromHeight(70) : Size.fromHeight(50);
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: this.widget.preferredSize,
      child: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          this.widget.pageTitle,
          style: GoogleFonts.yesevaOne(
            color: Color.fromARGB(255, 195, 165, 89),
            fontSize: 42
          ) 
        ),
        actions: _appBarActions(),
        centerTitle: false,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      )
    );
  }

  List<Widget> _appBarActions(){
    List<Widget> appbarActions = [];
    var size = MediaQuery.of(context).size;
    if(kIsWeb && size.width > 700 && !AppGlobals.forceAppMode){
      appbarActions.add(FullNavbarItem(title: "Home", icon: Icons.home_max, pageIndex: 0, currentPage: this.widget.currentPage, isDrawer: false, setCurrentPage: this.widget.setCurrentPage));
      appbarActions.add(FullNavbarItem(title: "Messages", icon: Icons.messenger_outline_rounded, pageIndex: 1, currentPage: this.widget.currentPage, isDrawer: false, setCurrentPage: this.widget.setCurrentPage));
      appbarActions.add(FullNavbarItem(title: "Profile", icon: Icons.person, pageIndex: 2, currentPage: this.widget.currentPage, isDrawer: false, setCurrentPage: this.widget.setCurrentPage));
    }
    return appbarActions;
  }
}