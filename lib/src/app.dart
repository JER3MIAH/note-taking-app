import 'package:flutter/material.dart';
import 'features/home/data/bloc_providers.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/navigation/nav.dart';
import 'features/theme/data/bloc_providers.dart';
import 'features/theme/data/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/theme/logic/bloc/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...themeBlocProviders,
        ...homeBlocProviders,
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Note Taking App',
            theme: state.isDarkMode ? darkTheme : lightTheme,
            routes: {
              AppRoutes.home: (context) => HomeScreen(),
            },
            initialRoute: AppRoutes.home,
          );
        },
      ),
    );
  }
}
