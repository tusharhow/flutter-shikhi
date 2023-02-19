import 'package:flutter_shikhi/app/constants/route_constants.dart';
import 'package:flutter_shikhi/app/screens/details_page.dart';
import 'package:go_router/go_router.dart';
import '../responsive.dart';
import '../screens/devices/desktop_view.dart';
import '../screens/devices/homepage.dart';
import '../screens/devices/tablet_view.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.home,
        path: "/",
        builder: (context, state) => const Responsive(
          mobile: MyHomePage(),
          tablet: TabletView(),
          desktop: DesktopView(),
        ),
      ),
      GoRoute(
        name: RouteConstants.details,
        path: "/:subtitle",
        builder: (context, state) => DetailsPage(
          subtitle: state.params['subtitle']!,
        ),
      ),
     
    ],
  );
}
