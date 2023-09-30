import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/src/ui/category_list.dart';
import 'package:retail_app/src/ui/home.dart';
import 'package:retail_app/src/ui/main_wrapper.dart';
import 'package:retail_app/src/ui/order_list.dart';
import 'package:retail_app/src/ui/product_list.dart';

CustomTransitionPage withCustomAnimation(
    GoRouterState state, Widget child, int selectedIndex) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: MainWrapper(
      selectedIndex: selectedIndex,
      child: child,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return withCustomAnimation(state, const HomePage(), 0);
      },
    ),
    GoRoute(
      path: '/categories',
      pageBuilder: (context, state) {
        return withCustomAnimation(state, const CategoryListPage(), 1);
      },
    ),
    GoRoute(
      path: '/products',
      pageBuilder: (context, state) {
        return withCustomAnimation(state, const ProductListPage(), 2);
      },
    ),
    GoRoute(
      path: '/orders',
      pageBuilder: (context, state) {
        return withCustomAnimation(state, const OrderListPage(), 3);
      },
    ),
  ],
);
