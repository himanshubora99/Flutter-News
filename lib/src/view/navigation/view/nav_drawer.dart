
import 'package:flutter/material.dart';
import 'package:news_app/src/constants/app_colors.dart';
import 'package:news_app/src/helper/app_spacing.dart';
import 'package:news_app/src/view/navigation/widgets/nav_drawer_sections.dart';
import 'package:news_app/src/view/navigation/widgets/nav_drawer_subscribe.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  static const _contentPadding = AppSpacing.lg;
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(AppSpacing.lg),
        bottomRight: Radius.circular(AppSpacing.lg),
      ),
      child: Drawer(
        backgroundColor: AppColors.darkBackground,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: AppSpacing.xlg,
          ),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: _contentPadding + AppSpacing.xxs,
                horizontal: _contentPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Flutter News',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20)),
              ),
            ),
            const _NavDrawerDivider(),
            const NavDrawerSections(),
              const _NavDrawerDivider(),
            const NavDrawerSubscribe(),
          ],
        ),
      ),
    );
  }
}

class _NavDrawerDivider extends StatelessWidget {
  const _NavDrawerDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Colors.black);
  }
}
