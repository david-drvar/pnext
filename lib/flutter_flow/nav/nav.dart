import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'createAccount',
          path: '/createAccount',
          builder: (context, params) => CreateAccountWidget(),
        ),
        FFRoute(
          name: 'homePage_MAIN',
          path: '/homePageMAIN',
          builder: (context, params) => HomePageMAINWidget(),
        ),
        FFRoute(
          name: 'propertyDetails',
          path: '/propertyDetails',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => PropertyDetailsWidget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'searchProperties',
          path: '/searchProperties',
          builder: (context, params) => SearchPropertiesWidget(
            searchTerm: params.getParam('searchTerm', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'myTrips',
          path: '/myTrips',
          builder: (context, params) => MyTripsWidget(),
        ),
        FFRoute(
          name: 'tripDetails',
          path: '/tripDetails',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
            'tripRef': getDoc(['trips'], TripsRecord.fromSnapshot),
          },
          builder: (context, params) => TripDetailsWidget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
            tripRef: params.getParam('tripRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'propertyReview',
          path: '/propertyReview',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => PropertyReviewWidget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'bookNow',
          path: '/bookNow',
          asyncParams: {
            'propertyDetails':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => BookNowWidget(
            propertyDetails:
                params.getParam('propertyDetails', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'profilePage',
          path: '/profilePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'profilePage')
              : ProfilePageWidget(),
        ),
        FFRoute(
          name: 'paymentInfo',
          path: '/paymentInfo',
          builder: (context, params) => PaymentInfoWidget(),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          asyncParams: {
            'userProfile': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => EditProfileWidget(
            userProfile: params.getParam('userProfile', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'changePassword',
          path: '/changePassword',
          asyncParams: {
            'userProfile': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChangePasswordWidget(
            userProfile: params.getParam('userProfile', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'create_garage_1',
          path: '/createGarage1',
          builder: (context, params) => CreateGarage1Widget(),
        ),
        FFRoute(
          name: 'HomePage_ALT',
          path: '/homePageALT',
          builder: (context, params) => HomePageALTWidget(),
        ),
        FFRoute(
          name: 'createProperty_2',
          path: '/createProperty2',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
            'propertyAmenities':
                getDoc(['amenitities'], AmenititiesRecord.fromSnapshot),
          },
          builder: (context, params) => CreateProperty2Widget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
            propertyAmenities:
                params.getParam('propertyAmenities', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'createProperty_3',
          path: '/createProperty3',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => CreateProperty3Widget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'myProperties',
          path: '/myProperties',
          builder: (context, params) => MyPropertiesWidget(),
        ),
        FFRoute(
          name: 'propertyDetails_Owner',
          path: '/propertyDetailsOwner',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => PropertyDetailsOwnerWidget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'myBookings',
          path: '/myBookings',
          builder: (context, params) => MyBookingsWidget(),
        ),
        FFRoute(
          name: 'tripDetailsHOST',
          path: '/tripDetailsHOST',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
            'tripRef': getDoc(['trips'], TripsRecord.fromSnapshot),
          },
          builder: (context, params) => TripDetailsHOSTWidget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
            tripRef: params.getParam('tripRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'editProperty_1',
          path: '/editProperty1',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => EditProperty1Widget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'editProperty_2',
          path: '/editProperty2',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
            'propertyAmenities':
                getDoc(['amenitities'], AmenititiesRecord.fromSnapshot),
          },
          builder: (context, params) => EditProperty2Widget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
            propertyAmenities:
                params.getParam('propertyAmenities', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'editProperty_3',
          path: '/editProperty3',
          asyncParams: {
            'propertyRef':
                getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => EditProperty3Widget(
            propertyRef: params.getParam('propertyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'forgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'garage_page1',
          path: '/garagePage1',
          builder: (context, params) => GaragePage1Widget(),
        ),
        FFRoute(
          name: 'createProperty_1Copy',
          path: '/createProperty1Copy',
          builder: (context, params) => CreateProperty1CopyWidget(),
        ),
        FFRoute(
          name: 'garage_availabilities',
          path: '/garageAvailabilities',
          builder: (context, params) => GarageAvailabilitiesWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'create_garage_2',
          path: '/createGarage2',
          builder: (context, params) => CreateGarage2Widget(),
        ),
        FFRoute(
          name: 'create_garage_4_price',
          path: '/createGarage4Price',
          builder: (context, params) => CreateGarage4PriceWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'Create_Garage_3',
          path: '/createGarage3',
          builder: (context, params) => CreateGarage3Widget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'TimeslotCalendar',
          path: '/timeslotCalendar',
          builder: (context, params) => TimeslotCalendarWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'create_garage_2_foto_video',
          path: '/createGarage2FotoVideo',
          builder: (context, params) => CreateGarage2FotoVideoWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'foto_video',
          path: '/fotoVideo',
          builder: (context, params) => FotoVideoWidget(),
        ),
        FFRoute(
          name: 'TimeslotCalendarCopy',
          path: '/timeslotCalendarCopy',
          builder: (context, params) => TimeslotCalendarCopyWidget(),
        ),
        FFRoute(
          name: 'create_garage_disclaimer_page',
          path: '/createGarageDisclaimerPage',
          builder: (context, params) => CreateGarageDisclaimerPageWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'Confirm_Page',
          path: '/confirmPage',
          builder: (context, params) => ConfirmPageWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'reservation_1',
          path: '/reservation1',
          builder: (context, params) => Reservation1Widget(
            datestart: params.getParam('datestart', ParamType.DateTime),
          ),
        ),
        FFRoute(
          name: 'reservation_2',
          path: '/reservation2',
          builder: (context, params) => Reservation2Widget(
            reservationref: params.getParam('reservationref',
                ParamType.DocumentReference, false, ['reservation']),
            carCode: params.getParam('carCode', ParamType.String),
            size: params.getParam('size', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'reservation_4',
          path: '/reservation4',
          asyncParams: {
            'documentGarage': getDoc(['garages'], GaragesRecord.fromSnapshot),
          },
          builder: (context, params) => Reservation4Widget(
            reservationref: params.getParam('reservationref',
                ParamType.DocumentReference, false, ['reservation']),
            documentGarage:
                params.getParam('documentGarage', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'reservation_5',
          path: '/reservation5',
          builder: (context, params) => Reservation5Widget(
            reservationref: params.getParam('reservationref',
                ParamType.DocumentReference, false, ['reservation']),
          ),
        ),
        FFRoute(
          name: 'homePage_Garages',
          path: '/homePageGarages',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'homePage_Garages')
              : HomePageGaragesWidget(),
        ),
        FFRoute(
          name: 'garageDetails',
          path: '/garageDetails',
          builder: (context, params) => GarageDetailsWidget(
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
            isKeyboxVisible: params.getParam('isKeyboxVisible', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'ownersGarages',
          path: '/ownersGarages',
          builder: (context, params) => OwnersGaragesWidget(),
        ),
        FFRoute(
          name: 'reservation_3Map',
          path: '/reservation3Map',
          builder: (context, params) => Reservation3MapWidget(
            reservationref: params.getParam('reservationref',
                ParamType.DocumentReference, false, ['reservation']),
          ),
        ),
        FFRoute(
          name: 'create_garage_1Peppe',
          path: '/createGarage1Peppe',
          builder: (context, params) => CreateGarage1PeppeWidget(),
        ),
        FFRoute(
          name: 'create_garage_1PeppeCopy',
          path: '/createGarage1PeppeCopy',
          builder: (context, params) => CreateGarage1PeppeCopyWidget(),
        ),
        FFRoute(
          name: 'reservations',
          path: '/reservations',
          builder: (context, params) => ReservationsWidget(
            datestart: params.getParam('datestart', ParamType.DateTime),
          ),
        ),
        FFRoute(
          name: 'create_garage_1PlacePicker',
          path: '/createGarage1PlacePicker',
          builder: (context, params) => CreateGarage1PlacePickerWidget(),
        ),
        FFRoute(
          name: 'edit_garage_address',
          path: '/editGarageAddress',
          asyncParams: {
            'garage': getDoc(['garages'], GaragesRecord.fromSnapshot),
          },
          builder: (context, params) => EditGarageAddressWidget(
            garage: params.getParam('garage', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'edit_garage',
          path: '/editGarage',
          builder: (context, params) => EditGarageWidget(
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'edit_garage_vehicle_type',
          path: '/editGarageVehicleType',
          asyncParams: {
            'garage': getDoc(['garages'], GaragesRecord.fromSnapshot),
          },
          builder: (context, params) => EditGarageVehicleTypeWidget(
            garage: params.getParam('garage', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'edit_garage_validity',
          path: '/editGarageValidity',
          builder: (context, params) => EditGarageValidityWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'edit_garage_media',
          path: '/editGarageMedia',
          asyncParams: {
            'newGarageRef': getDoc(['garages'], GaragesRecord.fromSnapshot),
          },
          builder: (context, params) => EditGarageMediaWidget(
            newGarageRef: params.getParam('newGarageRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'edit_garage_availability',
          path: '/editGarageAvailability',
          asyncParams: {
            'newGarageRef': getDoc(['garages'], GaragesRecord.fromSnapshot),
          },
          builder: (context, params) => EditGarageAvailabilityWidget(
            newGarageRef: params.getParam('newGarageRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'edit_garage_key',
          path: '/editGarageKey',
          builder: (context, params) => EditGarageKeyWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'edit_garage_disclaimer',
          path: '/editGarageDisclaimer',
          builder: (context, params) => EditGarageDisclaimerWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'edit_garage_price',
          path: '/editGaragePrice',
          builder: (context, params) => EditGaragePriceWidget(
            newGarageRef: params.getParam('newGarageRef',
                ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'reservation_1Copy',
          path: '/reservation1Copy',
          builder: (context, params) => Reservation1CopyWidget(
            datestart: params.getParam('datestart', ParamType.DateTime),
            timePickedOk: params.getParam('timePickedOk', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'reservation_4Copy',
          path: '/reservation4Copy',
          asyncParams: {
            'documentGarage': getDoc(['garages'], GaragesRecord.fromSnapshot),
          },
          builder: (context, params) => Reservation4CopyWidget(
            reservationref: params.getParam('reservationref',
                ParamType.DocumentReference, false, ['reservation']),
            documentGarage:
                params.getParam('documentGarage', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'garageDetailsForReservation',
          path: '/garageDetailsForReservation',
          builder: (context, params) => GarageDetailsForReservationWidget(
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
          ),
        ),
        FFRoute(
          name: 'myReservations',
          path: '/myReservations',
          builder: (context, params) => MyReservationsWidget(),
        ),
        FFRoute(
          name: 'reservationDetails',
          path: '/reservationDetails',
          builder: (context, params) => ReservationDetailsWidget(
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'reservationDetailsMap',
          path: '/reservationDetailsMap',
          builder: (context, params) => ReservationDetailsMapWidget(
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
          ),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          asyncParams: {
            'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chatUser: params.getParam('chatUser', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
          ),
        ),
        FFRoute(
          name: 'AllChatsPage',
          path: '/allChatsPage',
          builder: (context, params) => AllChatsPageWidget(),
        ),
        FFRoute(
          name: 'myReservationsTabbar',
          path: '/myReservationsTabbar',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'myReservationsTabbar')
              : MyReservationsTabbarWidget(),
        ),
        FFRoute(
          name: 'AllChatsPageTabbar',
          path: '/allChatsPageTabbar',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'AllChatsPageTabbar')
              : AllChatsPageTabbarWidget(),
        ),
        FFRoute(
          name: 'feedbackPage',
          path: '/feedbackPage',
          builder: (context, params) => FeedbackPageWidget(),
        ),
        FFRoute(
          name: 'paymentConfirmed',
          path: '/paymentConfirmed',
          builder: (context, params) => PaymentConfirmedWidget(
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
          ),
        ),
        FFRoute(
          name: 'PagePayWith',
          path: '/pagePayWith',
          builder: (context, params) => PagePayWithWidget(
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'CreditCardPayment',
          path: '/creditCardPayment',
          builder: (context, params) => CreditCardPaymentWidget(
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
          ),
        ),
        FFRoute(
          name: 'Paypalpayment',
          path: '/paypalpayment',
          builder: (context, params) => PaypalpaymentWidget(
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
          ),
        ),
        FFRoute(
          name: 'SatispayPayment',
          path: '/satispayPayment',
          builder: (context, params) => SatispayPaymentWidget(
            reservationRef: params.getParam('reservationRef',
                ParamType.DocumentReference, false, ['reservation']),
            garageRef: params.getParam(
                'garageRef', ParamType.DocumentReference, false, ['garages']),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
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
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/pnext_urbanist_splash_screen.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

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
