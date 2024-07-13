import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensimob/app/modules/MainMenu/controllers/main_menu_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ForumView extends GetView<MainMenuController> {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
    
        onPressed: () {
          launch('https://t.me/presensiguru');
        },
        child: Text('Buka Forum'),
      ),
    );
  }
}
