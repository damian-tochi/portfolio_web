import 'package:go_router/go_router.dart';
import 'package:my_portfolio/pages/home/home.dart';
import 'package:my_portfolio/pages/json_to_dart/json_to_dart.dart';
import 'package:my_portfolio/pages/video_downloader/video_downloader.dart';
import 'package:my_portfolio/pages/works/works.dart';


class Routes {
  static const String initial = "/";
  static const String myWorks = "works";
  static const String jsonToDart = "json_to_dart";
  static const String videoDownloader = "video_downloader";
  static const String smartBillBookPrivacy = "smart_bill_book/privacy";
}

class RouterGenerator {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.initial,
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            path: Routes.myWorks,
            name: Routes.myWorks,
            builder: (context, state) =>
                const MyWorksScreen(),
          ),
          GoRoute(
            path: Routes.jsonToDart,
            name: Routes.jsonToDart,
            builder: (context, state) =>
                const JsonToDartScreen(),
          ),
          GoRoute(
            path: Routes.videoDownloader,
            name: Routes.videoDownloader,
            builder: (context, state) =>
                const VideoDownloaderScreen(),
          ),
        ],
      ),
    ],
  );
}
