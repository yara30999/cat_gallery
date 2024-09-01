import 'package:flutter/material.dart';
import '../../../domain/entities/bottom_nav_icon.dart';
import '../../../generated/l10n.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class HomeViewTablet extends StatefulWidget {
  const HomeViewTablet({
    super.key,
  });

  @override
  State<HomeViewTablet> createState() => _HomeViewTabletState();
}

class _HomeViewTabletState extends State<HomeViewTablet> {
  final _scaffoldKeyTablet = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  List<BottomNavIconEntity> get _navigationItems => [
        BottomNavIconEntity(icon: Icons.home, label: S.current.Home),
        BottomNavIconEntity(icon: Icons.favorite, label: S.current.Favorites),
        BottomNavIconEntity(
            icon: Icons.drive_folder_upload, label: S.current.Uploads),
        BottomNavIconEntity(
            icon: Icons.how_to_vote_outlined, label: S.current.Votes),
      ];

  void onTabTapped(int index) {
    if (_currentPage != index) {
      setState(() {
        _currentPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      key: _scaffoldKeyTablet,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKeyTablet,
      ),
      drawer: CustomDrawer(
        scaffoldKey: _scaffoldKeyTablet,
      ),
      body: IndexedStack(
        index: _currentPage,
        children: const [
          MainBreedsNavigator(),
          FavoritesNavigator(),
          UploadsNavigator(),
          VotesNavigator(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: onTabTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: _navigationItems.map((e) {
          return BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.label,
              backgroundColor: Theme.of(context).primaryColor);
        }).toList(),
        selectedLabelStyle: Styles.style14Medium(),
        unselectedLabelStyle: Styles.style12Medium(),
      ),
    );
  }
}
