import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imageproject/features/photo/presentation/pages/main_photo_page_view.dart';
import 'package:imageproject/features/photo/presentation/pages/photo_core_page_view.dart';
import 'package:imageproject/features/photo/presentation/pages/photo_detail_page_view.dart';

import '../../injection.dart';
import 'error_screen.dart';

class AppRouter {
  static final photoNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    navigatorKey: navigatorKey,
    initialLocation: '/photos',
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: photoNavigatorKey,
          builder: (context, state, child) {
            return PhotoCorePageView(
              body: child,
            );
          },
          routes: [
            GoRoute(
                path: '/photos',
                name: 'photos',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MainPhotoPageView()),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: "photodetails",
                    pageBuilder: (context, state) => NoTransitionPage(
                        child: PhotoDetailPageView(
                      id: (state.extra as List)[0],
                      photoCubit: (state.extra as List)[1],
                    )),
                  ),
                ]),
          ])
    ],
  );
}
