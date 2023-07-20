import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:news_app/src/constants/app_colors.dart';
import 'package:news_app/src/helper/app_spacing.dart';

class NavDrawerSections extends StatelessWidget {
  const NavDrawerSections({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const NavDrawerSectionsTitle(),
            NavDrawerSectionItem(
              title: 'Sports',
              selected: true,
              onTap: () {
                Scaffold.of(context).closeDrawer();
              },
            ),
        SizedBox(
          height: 10,
        ),
        NavDrawerSectionItem(
          title: 'Technology',
          selected: false,
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
        )
      ],
    );
  }
}

class NavDrawerSectionsTitle extends StatelessWidget {
  const NavDrawerSectionsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg + AppSpacing.xxs,
        ),
        child: Text(
          'Sections',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryContainer,
          ),
        ),
      ),
    );
  }
}

class NavDrawerSectionItem extends StatelessWidget {
  const NavDrawerSectionItem({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.selected = false,
  });

  static const _borderRadius = 100.0;

  final String title;
  final Widget? leading;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: leading,
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: selected ? AppSpacing.xlg : AppSpacing.lg,
        vertical: AppSpacing.lg + AppSpacing.xxs,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
      ),
      horizontalTitleGap: AppSpacing.md,
      minLeadingWidth: AppSpacing.xlg,
      selectedTileColor: Colors.white.withOpacity(0.08),
      selected: selected,
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: selected
              ? AppColors.highEmphasisPrimary
              : AppColors.mediumEmphasisPrimary,
        ),
      ),
    );
  }
}
