import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/custom_loader_screen/custom_loader_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/auth/login_screen.dart';
import '../presentation/views/store/store_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (_) => const LoginScreen(),
  StoreScreen.routeName: (_) => const StoreScreen(),
  CustomLoaderScreen.routeName: (_) => const CustomLoaderScreen(),
};
