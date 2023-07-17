import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : ValuesWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : ValuesWidget(),
        ),
        FFRoute(
          name: 'Splash',
          path: '/splash',
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: 'Values',
          path: '/values',
          builder: (context, params) => ValuesWidget(),
        ),
        FFRoute(
          name: 'GettingStarted',
          path: '/gettingStarted',
          builder: (context, params) => GettingStartedWidget(),
        ),
        FFRoute(
          name: 'signupwithphone',
          path: '/signupwithphone',
          builder: (context, params) => SignupwithphoneWidget(),
        ),
        FFRoute(
          name: 'OtpSignup',
          path: '/otpSignup',
          builder: (context, params) => OtpSignupWidget(
            phoneNo: params.getParam('phoneNo', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'home') : HomeWidget(),
        ),
        FFRoute(
          name: 'OtpLogin',
          path: '/otpLogin',
          builder: (context, params) => OtpLoginWidget(
            phoneNo: params.getParam('phoneNo', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Loginwithphone',
          path: '/loginwithphone',
          builder: (context, params) => LoginwithphoneWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: 'AvatarDescription',
          path: '/avatarDescription',
          asyncParams: {
            'promptDoc': getDoc(['prompt'], PromptRecord.serializer),
          },
          builder: (context, params) => AvatarDescriptionWidget(
            promptDoc: params.getParam('promptDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'UploadImageGuidelines',
          path: '/uploadImageGuidelines',
          builder: (context, params) => UploadImageGuidelinesWidget(),
        ),
        FFRoute(
          name: 'Instructions',
          path: '/instructions',
          asyncParams: {
            'guideDoc': getDoc(['guidelines'], GuidelinesRecord.serializer),
          },
          builder: (context, params) => InstructionsWidget(
            guideDoc: params.getParam('guideDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'UploadingImages',
          path: '/uploadingImages',
          builder: (context, params) => UploadingImagesWidget(
            images: params.getParam<String>('images', ParamType.String, true),
          ),
        ),
        FFRoute(
          name: 'CreateUserProfile',
          path: '/createUserProfile',
          builder: (context, params) => CreateUserProfileWidget(
            uploadedimages: params.getParam<String>(
                'uploadedimages', ParamType.String, true),
          ),
        ),
        FFRoute(
          name: 'MyAvatars',
          path: '/myAvatars',
          builder: (context, params) => MyAvatarsWidget(),
        ),
        FFRoute(
          name: 'MyImage',
          path: '/myImage',
          asyncParams: {
            'prom': getDoc(['prompt'], PromptRecord.serializer),
          },
          builder: (context, params) => MyImageWidget(
            prom: params.getParam('prom', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ModelBundles',
          path: '/modelBundles',
          builder: (context, params) => ModelBundlesWidget(),
        ),
        FFRoute(
          name: 'paymentOptionTune',
          path: '/paymentOptionTune',
          builder: (context, params) => PaymentOptionTuneWidget(
            order: params.getParam('order', ParamType.DocumentReference, false,
                ['profile', 'order']),
          ),
        ),
        FFRoute(
          name: 'AvatarScreen',
          path: '/avatarScreen',
          asyncParams: {
            'imageGeneration': getDoc(['profile', 'image_generation'],
                ImageGenerationRecord.serializer),
          },
          builder: (context, params) => AvatarScreenWidget(
            imageGeneration:
                params.getParam('imageGeneration', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ImageScreen',
          path: '/imageScreen',
          builder: (context, params) => ImageScreenWidget(
            image: params.getParam('image', ParamType.String),
            imahepath: params.getParam('imahepath', ParamType.int),
            images: params.getParam<String>('images', ParamType.String, true),
          ),
        ),
        FFRoute(
          name: 'paymentTune',
          path: '/paymentTune',
          builder: (context, params) => PaymentTuneWidget(
            url: params.getParam('url', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AvatarBundle',
          path: '/avatarBundle',
          builder: (context, params) => AvatarBundleWidget(),
        ),
        FFRoute(
          name: 'paymentAvatar',
          path: '/paymentAvatar',
          builder: (context, params) => PaymentAvatarWidget(
            url: params.getParam('url', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'paymentOptionAvatar',
          path: '/paymentOptionAvatar',
          builder: (context, params) => PaymentOptionAvatarWidget(
            order: params.getParam('order', ParamType.DocumentReference, false,
                ['profile', 'order']),
          ),
        ),
        FFRoute(
          name: 'TermsandConditions',
          path: '/termsandConditions',
          builder: (context, params) => TermsandConditionsWidget(),
        ),
        FFRoute(
          name: 'Policy',
          path: '/policy',
          builder: (context, params) => PolicyWidget(),
        ),
        FFRoute(
          name: 'DeleteAccount',
          path: '/deleteAccount',
          builder: (context, params) => DeleteAccountWidget(),
        ),
        FFRoute(
          name: 'OrderSummary',
          path: '/orderSummary',
          asyncParams: {
            'order': getDoc(['profile', 'order'], OrderRecord.serializer),
          },
          builder: (context, params) => OrderSummaryWidget(
            order: params.getParam('order', ParamType.Document),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/values';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.black,
                  child: Image.asset(
                    'assets/images/image_(3)_1_(2).png',
                    fit: BoxFit.none,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
