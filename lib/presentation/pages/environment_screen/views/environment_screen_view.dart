import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/config.dart';
import 'package:transmedia/presentation/pages/home/view/home.screen.dart';

import '../controllers/environment_screen_controller.dart';

class EnvironmentScreenView extends GetView<EnvironmentScreenController> {
  const EnvironmentScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
      location: BannerLocation.topStart,
      message: env!,
      color: env == Environments.QAS ? Colors.blue : Colors.purple,
      child: const HomeScreen(),
    )
        : const SizedBox(child: HomeScreen());
  }
}
