import 'package:flutter/material.dart';
import '../../domain/entities/bottom_nav_icon.dart';
import '../../generated/l10n.dart';
import '../resources/global_keys_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
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
  int _currentPage = 0;
  static const double _paddingValue = 20.0;
  late ScrollController _mainBreedsScrollController;
  late ScrollController _favoritesScrollController;
  late ScrollController _uploadsScrollController;
  late ScrollController _votesScrollController;

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
    _mainBreedsScrollController = ScrollController();
    _favoritesScrollController = ScrollController();
    _uploadsScrollController = ScrollController();
    _votesScrollController = ScrollController();
  }

  @override
  void dispose() {
    _mainBreedsScrollController.dispose();
    _favoritesScrollController.dispose();
    _uploadsScrollController.dispose();
    _votesScrollController.dispose();
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
      key: GlobalKeys.scaffoldKey,
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          _scrollControllerListener(scrollNotification);
          return true;
        },
        child: IndexedStack(
          index: _currentPage,
          children: [
            MainBreedsNavigator(
              scrollController: _mainBreedsScrollController,
            ),
            FavoritesNavigator(
              scrollController: _favoritesScrollController,
            ),
            UploadsNavigator(
              scrollController: _uploadsScrollController,
            ),
            VotesNavigator(
              scrollController: _votesScrollController,
            ),
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
