import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@RoutePage()
class HomeEmptyScreen extends AutoRouter {
  const HomeEmptyScreen({super.key});
}

@RoutePage()
class MenuEmptyScreen extends AutoRouter {
  const MenuEmptyScreen({super.key});
}

@RoutePage()
class AccountsEmptyScreen extends AutoRouter {
  const AccountsEmptyScreen({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(page: AppInformationRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: EnterOtpForgotPasswordRoute.page),
    AutoRoute(page: ConfirmPasswordForgotPasswordRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      // initial: true,
      children: [
        AutoRoute(
          path: 'home',
          page: HomeEmptyRoute.page,
          children: [
            AutoRoute(page: HomeTab.page, initial: true),
          ],
        ),
        AutoRoute(
          path: 'menu',
          page: MenuEmptyRoute.page,
          children: [
            AutoRoute(page: MenuTab.page, initial: true),
          ],
        ),
        AutoRoute(
          path: 'account',
          page: AccountsEmptyRoute.page,
          children: [
            AutoRoute(page: AccountTab.page, initial: true),
            AutoRoute(page: PrivacyPolicyRoute.page),
            AutoRoute(page: TermsAndConditionsRoute.page),
          ],
        ),
      ],
    ),
    AutoRoute(page: CustomerListingRoute.page),
    AutoRoute(page: AddCustomerRoute.page),
    AutoRoute(page: CustomerProfileRoute.page),
    AutoRoute(page: ProductsListingRoute.page),
    AutoRoute(page: TransactionListingRoute.page),
    AutoRoute(page: NewSalesRoute.page),
    AutoRoute(page: URLEnteringRoute.page),
    AutoRoute(page: ReviewOrdersRoute.page),
    AutoRoute(page: DepartmentsListingRoute.page),
    AutoRoute(page: SaleOrdersListingRoute.page),
  ];
}