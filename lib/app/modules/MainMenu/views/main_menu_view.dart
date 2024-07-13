import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:presensimob/app/modules/About/views/about_view.dart';
import 'package:presensimob/app/modules/MainMenu/views/forum_view.dart';
import 'package:presensimob/app/modules/MainMenu/views/home_menu_view.dart';
import 'package:presensimob/app/modules/Pengumuman/views/pengumuman_view.dart';
import 'package:presensimob/app/routes/app_pages.dart';
import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   elevation: 0,
      //   foregroundColor: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(30),
      //     ),
      //   ),
      //   title: const Text('I.H.S.A.N'),
      //   centerTitle: true,
      // ),

      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: PersistentTabView(
        context,
        controller: controller.persistentTabController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white),
        navBarStyle: NavBarStyle.neumorphic,
        onItemSelected: (value) {
          if (value == 1) {
            Get.offAllNamed(Routes.LAPORAN_PRESENSI);
          }
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 0, 219, 197),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(Icons.add_chart),
      //         onPressed: () {
      //           Get.offAllNamed(Routes.LAPORAN_PRESENSI);
      //         },
      //       ),
      //       label: 'Laporan',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //         onTap: () {
      //           launch('https://t.me/presensiguru');
      //         },
      //         child: Icon(Icons.forum_rounded),
      //       ),
      //       label: 'Forum',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(Icons.security_rounded),
      //         onPressed: () {
      //           Get.offAllNamed(Routes.PENGUMUMAN);
      //         },
      //       ),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeMenuView(),
      const SizedBox(),
      ForumView(),
      PengumumanView(),
      AboutView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add_chart),
        title: ("Laporan"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.forum_rounded),
        title: ("Forum"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.security_rounded),
        title: ("Settings"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.info),
        title: ("About"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
