// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:ekasys/routes/app_router.dart' as _i2;
import 'package:ekasys/screens/customers/add_customer.dart' as _i3;
import 'package:ekasys/screens/customers/customer_listing.dart' as _i6;
import 'package:ekasys/screens/customers/customer_profile.dart' as _i7;
import 'package:ekasys/screens/departments/departments_listing.dart' as _i8;
import 'package:ekasys/screens/home/account_tab.dart' as _i1;
import 'package:ekasys/screens/home/home_screen.dart' as _i11;
import 'package:ekasys/screens/home/home_tab.dart' as _i12;
import 'package:ekasys/screens/home/menu_tab.dart' as _i13;
import 'package:ekasys/screens/login/confirm_password_forgot_password.dart'
    as _i5;
import 'package:ekasys/screens/login/enter_otp_forgot_password.dart' as _i9;
import 'package:ekasys/screens/login/forgot_password.dart' as _i10;
import 'package:ekasys/screens/login/sign_in.dart' as _i19;
import 'package:ekasys/screens/login/sign_up.dart' as _i20;
import 'package:ekasys/screens/login/url_screen.dart' as _i24;
import 'package:ekasys/screens/products/products_listing.dart' as _i16;
import 'package:ekasys/screens/profile/privacy_policy.dart' as _i15;
import 'package:ekasys/screens/profile/terms_and_conditions.dart' as _i22;
import 'package:ekasys/screens/sales/new_sales.dart' as _i14;
import 'package:ekasys/screens/sales/review_orders.dart' as _i17;
import 'package:ekasys/screens/sales/sale_orders_listing.dart' as _i18;
import 'package:ekasys/screens/splash_screen/app_information_screen.dart'
    as _i4;
import 'package:ekasys/screens/splash_screen/splash_screen.dart' as _i21;
import 'package:ekasys/screens/transactions/transaction_listing.dart' as _i23;
import 'package:flutter/cupertino.dart' as _i26;
import 'package:flutter/material.dart' as _i27;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AccountTab.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountTab(),
      );
    },
    AccountsEmptyRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AccountsEmptyScreen(),
      );
    },
    AddCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<AddCustomerRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddCustomerScreen(
          key: args.key,
          isUpdate: args.isUpdate,
        ),
      );
    },
    AppInformationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AppInformationScreen(),
      );
    },
    ConfirmPasswordForgotPasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ConfirmPasswordForgotPasswordScreen(),
      );
    },
    CustomerListingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CustomerListingScreen(),
      );
    },
    CustomerProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CustomerProfileScreen(),
      );
    },
    DepartmentsListingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DepartmentsListingScreen(),
      );
    },
    EnterOtpForgotPasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EnterOtpForgotPasswordScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgotPasswordScreen(),
      );
    },
    HomeEmptyRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeEmptyScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomeScreen(),
      );
    },
    HomeTab.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.HomeTab(),
      );
    },
    MenuEmptyRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MenuEmptyScreen(),
      );
    },
    MenuTab.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MenuTab(),
      );
    },
    NewSalesRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.NewSalesScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PrivacyPolicyScreen(),
      );
    },
    ProductsListingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProductsListingScreen(),
      );
    },
    ReviewOrdersRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ReviewOrdersScreen(),
      );
    },
    SaleOrdersListingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SaleOrdersListingScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.SignInScreen(
          key: args.key,
          departmentValue: args.departmentValue,
          departmentId: args.departmentId,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SplashScreen(),
      );
    },
    TermsAndConditionsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.TermsAndConditionsScreen(),
      );
    },
    TransactionListingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.TransactionListingScreen(),
      );
    },
    URLEnteringRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.URLEnteringScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountTab]
class AccountTab extends _i25.PageRouteInfo<void> {
  const AccountTab({List<_i25.PageRouteInfo>? children})
      : super(
          AccountTab.name,
          initialChildren: children,
        );

  static const String name = 'AccountTab';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountsEmptyScreen]
class AccountsEmptyRoute extends _i25.PageRouteInfo<void> {
  const AccountsEmptyRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AccountsEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountsEmptyRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddCustomerScreen]
class AddCustomerRoute extends _i25.PageRouteInfo<AddCustomerRouteArgs> {
  AddCustomerRoute({
    _i26.Key? key,
    required bool isUpdate,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AddCustomerRoute.name,
          args: AddCustomerRouteArgs(
            key: key,
            isUpdate: isUpdate,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCustomerRoute';

  static const _i25.PageInfo<AddCustomerRouteArgs> page =
      _i25.PageInfo<AddCustomerRouteArgs>(name);
}

class AddCustomerRouteArgs {
  const AddCustomerRouteArgs({
    this.key,
    required this.isUpdate,
  });

  final _i26.Key? key;

  final bool isUpdate;

  @override
  String toString() {
    return 'AddCustomerRouteArgs{key: $key, isUpdate: $isUpdate}';
  }
}

/// generated route for
/// [_i4.AppInformationScreen]
class AppInformationRoute extends _i25.PageRouteInfo<void> {
  const AppInformationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AppInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppInformationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ConfirmPasswordForgotPasswordScreen]
class ConfirmPasswordForgotPasswordRoute extends _i25.PageRouteInfo<void> {
  const ConfirmPasswordForgotPasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ConfirmPasswordForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmPasswordForgotPasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CustomerListingScreen]
class CustomerListingRoute extends _i25.PageRouteInfo<void> {
  const CustomerListingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CustomerListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerListingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CustomerProfileScreen]
class CustomerProfileRoute extends _i25.PageRouteInfo<void> {
  const CustomerProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CustomerProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DepartmentsListingScreen]
class DepartmentsListingRoute extends _i25.PageRouteInfo<void> {
  const DepartmentsListingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DepartmentsListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DepartmentsListingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EnterOtpForgotPasswordScreen]
class EnterOtpForgotPasswordRoute extends _i25.PageRouteInfo<void> {
  const EnterOtpForgotPasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          EnterOtpForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterOtpForgotPasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i25.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeEmptyScreen]
class HomeEmptyRoute extends _i25.PageRouteInfo<void> {
  const HomeEmptyRoute({List<_i25.PageRouteInfo>? children})
      : super(
          HomeEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeEmptyRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomeScreen]
class HomeRoute extends _i25.PageRouteInfo<void> {
  const HomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomeTab]
class HomeTab extends _i25.PageRouteInfo<void> {
  const HomeTab({List<_i25.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MenuEmptyScreen]
class MenuEmptyRoute extends _i25.PageRouteInfo<void> {
  const MenuEmptyRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MenuEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuEmptyRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MenuTab]
class MenuTab extends _i25.PageRouteInfo<void> {
  const MenuTab({List<_i25.PageRouteInfo>? children})
      : super(
          MenuTab.name,
          initialChildren: children,
        );

  static const String name = 'MenuTab';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NewSalesScreen]
class NewSalesRoute extends _i25.PageRouteInfo<void> {
  const NewSalesRoute({List<_i25.PageRouteInfo>? children})
      : super(
          NewSalesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSalesRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i25.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProductsListingScreen]
class ProductsListingRoute extends _i25.PageRouteInfo<void> {
  const ProductsListingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ProductsListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsListingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ReviewOrdersScreen]
class ReviewOrdersRoute extends _i25.PageRouteInfo<void> {
  const ReviewOrdersRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ReviewOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewOrdersRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SaleOrdersListingScreen]
class SaleOrdersListingRoute extends _i25.PageRouteInfo<void> {
  const SaleOrdersListingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SaleOrdersListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaleOrdersListingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SignInScreen]
class SignInRoute extends _i25.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i27.Key? key,
    required String departmentValue,
    required String departmentId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(
            key: key,
            departmentValue: departmentValue,
            departmentId: departmentId,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i25.PageInfo<SignInRouteArgs> page =
      _i25.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    required this.departmentValue,
    required this.departmentId,
  });

  final _i27.Key? key;

  final String departmentValue;

  final String departmentId;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, departmentValue: $departmentValue, departmentId: $departmentId}';
  }
}

/// generated route for
/// [_i20.SignUpScreen]
class SignUpRoute extends _i25.PageRouteInfo<void> {
  const SignUpRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.TermsAndConditionsScreen]
class TermsAndConditionsRoute extends _i25.PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TermsAndConditionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsAndConditionsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i23.TransactionListingScreen]
class TransactionListingRoute extends _i25.PageRouteInfo<void> {
  const TransactionListingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TransactionListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionListingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.URLEnteringScreen]
class URLEnteringRoute extends _i25.PageRouteInfo<void> {
  const URLEnteringRoute({List<_i25.PageRouteInfo>? children})
      : super(
          URLEnteringRoute.name,
          initialChildren: children,
        );

  static const String name = 'URLEnteringRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
