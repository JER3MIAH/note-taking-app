import 'package:flutter/material.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.secondaryContainer,
                ),
                child: SvgAsset(
                  iconLogout,
                  height: 25,
                  color: theme.onPrimary,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    AppText(
                      'Logout',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      'Are you sure you want to close the app? Any unsaved changes will be lost.',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: theme.surfaceBright,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: theme.onSurface.withValues(alpha: .4),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(right: 15),
          child: Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                bHeight: 41,
                title: 'Cancel',
                color: theme.secondaryContainer,
                textColor: theme.onSurface,
                onTap: () {
                  AppNavigator(context).popDialog();
                },
              ),
              AppButton(
                bHeight: 41,
                title: 'Logout',
                color: theme.error,
                onTap: () async{
                  AppNavigator(context).popDialog();
                 await AppNavigator(context).exitApp();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
