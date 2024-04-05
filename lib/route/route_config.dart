import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_setup/route/route_paths.dart';
import '../app/view/counter/counter_screen.dart';
import '../app/view/home/home.dart';
import '../app/view/request/request.dart';
import '../app/view/setting/setting.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class RoutesConfig {

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);


  ///1)  Route Config...
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.initialRoute,
        path: Routes.initialRoute,
        builder: (context, state) =>  HomeView(name: "sanjana"),
      ),
      GoRoute(
        name: Routes.settings,
        path: Routes.settings,
        builder: (context, state) => const SettingView(),
      ),
      GoRoute(
        name: Routes.home,
        path: Routes.home,

        pageBuilder: (context, state) {
          return materialPage(state: state, child: HomeView());
        },
      ),
      GoRoute(
        name: Routes.request,
        path: Routes.request,
        pageBuilder: (context, state) {
          return materialPage(state: state, child: const RequestView());
        },
      ),
      GoRoute(
        name: Routes.counter,
        path: Routes.counter,
        pageBuilder: (context, state) {
          return materialPage(state: state, child: const CounterScreen());
        },
      ),
    ],

    errorPageBuilder: (context, state) {
      return unknownRoute(context: context, state: state);
    },
  );
  static GoRouter get router => _router;


  ///2)  Unknown Route...

  static MaterialPage unknownRoute({
    required BuildContext context,
    required GoRouterState state,
  }) {
    return MaterialPage(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('No Route defined for unknown  ${state.path}')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.green,
                  child: const Text('Home'),
                  onPressed: () {
                    context.go(Routes.initialRoute);
                  },
                ),
              ),
            ],
          ),
        ));
  }


  ///3)  Material Page ...

  static MaterialPage<dynamic> materialPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return MaterialPage(key: state.pageKey, child: child);
  }

  ///4)  Cupertino Page...

  static CupertinoPage<dynamic> cupertinoPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CupertinoPage(key: state.pageKey, child: child);
  }

  ///5)  Cupertino Page...

  static CustomTransitionPage<dynamic> customTransitionPage({
    required GoRouterState state,
    required Widget child,
    Curve? curve,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      barrierDismissible: barrierDismissible,
      opaque: opaque,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: curve ?? Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}

