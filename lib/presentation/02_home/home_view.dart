import 'package:flutter/material.dart';
import '../../domain/entities/bottom_nav_icon.dart';
import '../../generated/l10n.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import 'favorites/view/favorites_view_body.dart';
import 'uploads/view/uploads_view_body.dart';
import 'votes/view/votes_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentPage = 0;
  static const double _paddingValue = 20.0;
  final ScrollController _mainBreedsScrollController = ScrollController();
  final ScrollController _favoritesScrollController = ScrollController();
  final ScrollController _uploadsScrollController = ScrollController();
  final ScrollController _votesScrollController = ScrollController();

  List<BottomNavIcon> get _navigationItems => [
        BottomNavIcon(icon: Icons.home, label: S.current.Home),
        BottomNavIcon(icon: Icons.favorite, label: S.current.Favorites),
        BottomNavIcon(
            icon: Icons.drive_folder_upload, label: S.current.Uploads),
        BottomNavIcon(icon: Icons.how_to_vote_outlined, label: S.current.Votes),
      ];

  bool _isVisibleBottomNavBar = true;

  @override
  void initState() {
    super.initState();
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

  void onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // to give feeling of floating bottom nav bar
      extendBody: true,
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
            FavoritesViewBody(
              favoratesScreenScrollController: _favoritesScrollController,
            ),
            UploadsViewBody(
              uploadsScreenScrollController: _uploadsScrollController,
            ),
            VotesViewBody(
              votesScreenScrollController: _votesScrollController,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
