import 'package:flutter/material.dart';
import 'package:news_app/src/constants/app_colors.dart';
import 'package:news_app/src/helper/app_spacing.dart';


class NavDrawerSubscribe extends StatelessWidget {
  const NavDrawerSubscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        NavDrawerSubscribeTitle(),
        NavDrawerSubscribeSubtitle(),
        SizedBox(height: 5),
        NavDrawerSubscribeButton(),
      ],
    );
  }
}


class NavDrawerSubscribeTitle extends StatelessWidget {
  const NavDrawerSubscribeTitle({super.key});

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
          'Become a Subscriber',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.highEmphasisPrimary,
          ),
        ),
      ),
    );
  }
}


class NavDrawerSubscribeSubtitle extends StatelessWidget {
  const NavDrawerSubscribeSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        'Subscribe to access premium',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.mediumEmphasisPrimary,
        ),
      ),
    );
  }
}


class NavDrawerSubscribeButton extends StatelessWidget {
  const NavDrawerSubscribeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text('Subscribe',style: TextStyle(color: AppColors.redWine),));
  }
}
