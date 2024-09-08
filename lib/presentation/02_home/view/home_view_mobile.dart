import 'package:flutter/material.dart';
import '../../../domain/entities/bottom_nav_icon.dart';
import '../../../generated/l10n.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({
    super.key,
  });

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  final _scaffoldKeyMobile = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  static const double _paddingValue = 20.0;

  List<BottomNavIconEntity> get _navigationItems => [
        BottomNavIconEntity(icon: Icons.home, label: S.current.Home),
        BottomNavIconEntity(icon: Icons.favorite, label: S.current.Favorites),
        BottomNavIconEntity(
            icon: Icons.drive_folder_upload, label: S.current.Uploads),
        BottomNavIconEntity(
            icon: Icons.how_to_vote_outlined, label: S.current.Votes),
      ];

  bool _isVisibleBottomNavBar = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //context.read<BottomScrollControllersCubit>().disposeControllers();
    super.dispose();
  }

  void _scrollControllerListener(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollUpdateNotification) {
      if (scrollNotification.metrics.axis == Axis.vertical) {
        if (scrollNotification.scrollDelta! > 0) {
          // User scrolled down
          if (_isVisibleBottomNavBar) {
            setState(() {
              _isVisibleBottomNavBar = false;
            });
          }
        } else if (scrollNotification.scrollDelta! < 0) {
          // User scrolled up
          if (!_isVisibleBottomNavBar) {
            setState(() {
              _isVisibleBottomNavBar = true;
            });
          }
        }
      }
    }
  }

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
      // to give feeling of floating bottom nav bar
      extendBody: true,
      key: _scaffoldKeyMobile,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKeyMobile,
      ),
      drawer: CustomDrawer(
        scaffoldKey: _scaffoldKeyMobile,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          _scrollControllerListener(scrollNotification);
          return true;
        },
        child: IndexedStack(
          index: _currentPage,
          children: const [
            MainBreedsNavigator(),
            FavoritesNavigator(),
            UploadsNavigator(),
            VotesNavigator(),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: _isVisibleBottomNavBar
            ? kBottomNavigationBarHeight + (_paddingValue * 2)
            : 0.0,
        padding: const EdgeInsets.all(_paddingValue),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s20),
              child: BottomNavigationBar(
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
            ),
          ],
        ),
      ),
    );
  }
}
