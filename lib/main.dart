import 'package:deltainformatics/app/theme.dart';
import 'package:deltainformatics/features/create_product/bloc/create_product_bloc.dart';
import 'package:deltainformatics/features/home/bloc/home_bloc.dart';
import 'package:deltainformatics/features/product_details/bloc/product_details_bloc.dart';
import 'package:deltainformatics/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/keys.dart';
import 'features/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'features/categories/bloc/categorie_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("---------------------------------");
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarBloc>(create: (context) => BottomNavBarBloc(),),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(),),
        BlocProvider<ProductDetailsBloc>(create: (context) => ProductDetailsBloc(),),
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc(),),
        BlocProvider<CreateProductBloc>(create: (context) => CreateProductBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: primary
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.transparent,

            ),
            fontFamily: 'Gugi',
          ),
          home: SplashScreen(),

          ),
    );
  }
}


