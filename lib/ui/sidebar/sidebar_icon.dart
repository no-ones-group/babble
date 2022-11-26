import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

class SidebarIcon extends StatelessWidget {
  final int id;
  final IconData? icon;
  final HeroIcons? heroIcon;
  final void Function()? onTap;
  final SidebarController _sidebarController = Get.find<SidebarController>();
  SidebarIcon(
      {super.key, required this.id, this.icon, this.heroIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _sidebarController.hoveredId.value = id,
      onExit: (_) => _sidebarController.hoveredId.value = 0,
      child: GestureDetector(
        onTap: onTap,
        child: Obx(
          () => Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _sidebarController.selectedId.value == id ||
                      _sidebarController.hoveredId.value == id
                  ? SidebarConstants().sidebarIconEventBGColor
                  : SidebarConstants().sidebarIconBGColor,
            ),
            child: SizedBox(
              width: SidebarConstants().sidebarIconSize,
              height: SidebarConstants().sidebarIconSize,
              child: Center(
                child: icon == null
                    ? HeroIcon(
                        heroIcon!,
                        color: _sidebarController.selectedId.value == id ||
                                _sidebarController.hoveredId.value == id
                            ? SidebarConstants().sidebarIconEventColor
                            : SidebarConstants().sidebarIconColor,
                      )
                    : Icon(
                        icon,
                        color: _sidebarController.selectedId.value == id ||
                                _sidebarController.hoveredId.value == id
                            ? SidebarConstants().sidebarIconEventColor
                            : SidebarConstants().sidebarIconColor,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
