import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_root.dart';
import 'package:babble/ui/space/space_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  final RootController _rootController = Get.find<RootController>();
  Root({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          color: SidebarConstants().sidebarColor,
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SidebarRoot(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SpaceRoot(
                  title: _rootController.pageTitle.value,
                  body: _rootController.pageContent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
