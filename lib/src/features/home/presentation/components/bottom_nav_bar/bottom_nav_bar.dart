import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:note_taking_app/src/shared/shared.dart';

class AppBottomNavBar extends HookWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isMobile = DeviceType(context).isMobile;

    final labelIconMap = {
      'Home': iconHome,
      'Search': iconSearch,
      'Archived': iconArchive,
      'Tags': iconTag,
      'Settings': iconSettings,
    };

    void setIndex(int index) {
      context.read<BottomNavBarCubit>().setIndex(index);
    }

    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (_, selectedIndex) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: theme.inversePrimary,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: setIndex,
            enableFeedback: false,
            backgroundColor: theme.surface,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: theme.primary,
            unselectedItemColor: theme.onSurfaceVariant,
            showSelectedLabels: !isMobile,
            showUnselectedLabels: !isMobile,
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: theme.onSurfaceVariant,
            ),
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: theme.primary,
            ),
            items: List.generate(
              labelIconMap.length,
              (index) {
                final item = labelIconMap.entries.toList()[index];
                return BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: isMobile && (selectedIndex == index)
                          ? theme.secondary
                          : null,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SvgAsset(
                      item.value,
                      color: theme.onSurfaceVariant,
                    ),
                  ),
                  label: item.key,
                  activeIcon: SvgAsset(
                    item.value,
                    color: theme.primary,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
