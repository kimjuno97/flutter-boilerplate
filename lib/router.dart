import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naym_naym_cook/common/layouts/bnb_layout.dart';
import 'package:naym_naym_cook/features/home/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: HomeScreen.path,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: HomeScreen.path,
          builder: (context, state) => const HomeScreen(),
        ),

        /// [TODO] bnb 생기면 사용합니다.
        // _gnbFulShellRoute(),
      ],
    );
  },
);

StatefulShellRoute _gnbFulShellRoute() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return BNBLayout(child: navigationShell);
    },
    branches: [
      /// [TODO] 라우트 추가
      _buildBranch(
        //   shellNavigatorKey: _postsNavigatorKey,
        routes: [
          // GoRoute(
          //   path: PostsScreen.path,
          //   builder: (context, state) => const PostsScreen(),
          // ),
        ],
      ),

      /// [TODO] 라우트 추가
      _buildBranch(
        // shellNavigatorKey: _myNavigatorKey,
        routes: [
          // GoRoute(
          //   path: MyScreen.path,
          //   builder: (context, state) => const MyScreen(),
          // ),
        ],
      ),
    ],
  );
}

StatefulShellBranch _buildBranch({
  GlobalKey<NavigatorState>? shellNavigatorKey,
  required List<RouteBase> routes,
}) {
  return StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: routes,
  );
}
