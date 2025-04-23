import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/models/link.dart';
import 'package:my_portfolio/models/technology.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String? appPhotos;
  final String projectLink;
  final bool internalLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    this.appPhotos,
    required this.projectLink,
    this.internalLink = false,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Frontend",
      title: "Futur Xchange",
      description:
          "Involved in the frontend development of an internal fintech tool, implementing responsive UI components, integrating APIs, and optimizing user workflows.",
      appPhotos: AppConstants.nestJsImage,
      projectLink: "",
      techUsed: [
        TechnologyConstants.nestJs,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Chanelle MFB",
      description:
      "Established the mobile infrastructure for Chanelle, a mobile banking application built with Flutter for cross-platform support on Android and iOS.\nFocused on delivering a secure, scalable, and high-performance application while ensuring a consistent user experience across both platforms.\nDue to a Non-Disclosure Agreement (NDA), specific project details cannot be disclosed.",
      appPhotos: AppConstants.flutterImage,
      projectLink: "",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.android,
        TechnologyConstants.swift,
        TechnologyConstants.kotlin,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "uduX Music Player",
      description:
          "Established the mobile infrastructure for uduX, a music streaming app designed to rival Spotify in the African market.\nBuilt the native Android infrastructure using Kotlin, ensuring high performance and platform-specific optimizations. Additionally, developed the Flutter cross-platform infrastructure, enabling a unified codebase for both Android and iOS while maintaining a consistent and responsive user experience.\nFocused on optimizing streaming quality, minimizing latency, and delivering a visually appealing and responsive user interface. Collaborated on product design to align with market expectations and user preferences.",
      appPhotos: AppConstants.uduxImage,
      projectLink: "https://udux.com",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.android,
        TechnologyConstants.swift,
        TechnologyConstants.kotlin,
      ],
    ),
    ProjectModel(
      project: "Android App",
      title: "Grynd",
      description:
          "Collaborated with cross-functional teams to develop the Grynd app, an innovative approach to farming. Implemented automated testing procedures to ensure quality assurance standards were met. Developed native Android applications and frameworks using Kotlin,and Implemented caching mechanism to reduce data usage. Engineered robust app architecture and complex user interfaces. Applied expert knowledge of Android system frameworks to solve complicated problems.",
      appPhotos: AppConstants.gryndApp,
      projectLink: "",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.firebase,
        TechnologyConstants.kotlin,
      ],
    ),
    ProjectModel(
      project: "Android & iOS App",
      title: "Delonifera TV",
      description: "Developed and implemented content access restrictions on the Delonifera TV mobile app for both Android and iOS platforms, creating a clear distinction between freemium and premium user experiences.\nFor freemium users, restricted viewing access to a 20-minute clip of any selected movie, ensuring limited yet engaging content exposure. Integrated ads into the freemium experience, interrupting movies at strategic intervals and prompting users to upgrade for an uninterrupted viewing experience.",
      appPhotos: AppConstants.delonifera,
      internalLink: true,
      projectLink: "https://play.google.com/store/apps/details?id=com.app.delonifera&pcampaignid=web_share",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.swift,
      ],
      buttonText: "Playstore Link",
    ),
    ProjectModel(
      project: "Android App",
      title: "My School Library",
      description:
          "Assigned to resolve issues on the MySchoolLibrary mobile app, focusing on UI enhancements, in-app payments, and PDF file upload functionality for the admin panel.\nLeveraged Java and Kotlin to address and optimize UI issues, ensuring responsiveness across all screen sizes. Rewrote most of the XML layouts, replacing outdated RelativeLayouts with ConstraintLayouts, using constrained percentages for height and width to improve scalability and design consistency.\nImplemented Flutterwave for seamless local payments and Stripe for international transactions, enhancing the app’s payment capabilities. Followed best practices of Test-Driven Development (TDD) to maintain app stability and performance.",
      appPhotos: AppConstants.mySchoolLibImage,
      internalLink: true,
      projectLink: "https://play.google.com/store/apps/details?id=com.education.books.MySchoolLibrary&pcampaignid=web_share",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.firebase,
        TechnologyConstants.kotlin
      ],
      buttonText: "Product Link",
    ),
    ProjectModel(
      project: "Android App",
      title: "Blue Call",
      description: "Assigned to resolve issues on the Bluecall mobile app, specifically fixing the broken in-app calling and messaging features.\nLeveraged the Sinch library to restore and optimize real-time communication capabilities, ensuring reliable and high-quality voice calls and messaging. Integrated Firebase for backend support, enabling efficient data synchronization and real-time updates.\nApplied Java and Kotlin to troubleshoot and resolve performance issues, following best practices of Test-Driven Development (TDD) to maintain app stability and performance. Focused on product design enhancements and optimization, ensuring a seamless and responsive user experience.\nLive on all app stores.",
      appPhotos: AppConstants.blueCallImage,
      projectLink: "https://play.google.com/store/apps/details?id=com.free.talk.alh.global.im&pcampaignid=web_share",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.java,
      ],
      buttonText: "Product Link",
    ),
    ProjectModel(
      project: "Web App",
      title: "Star Arrival Hotel Website",
      description:
          "Designed and developed a responsive hotel website using modern web technologies, ensuring optimal performance, user experience, and cross-device compatibility.",
      appPhotos: AppConstants.stararrivalHotel,
      projectLink: "http://stararrivalhotels.com/",
      techUsed: [
        TechnologyConstants.javascript,
      ],
      buttonText: "Product Link",
    ),
    ProjectModel(
      project: "Android App",
      title: "HyCab",
      description:
          "Architected and developed a fully functional ride-sharing mobile app similar to Bolt for a client. Leveraged Java and Kotlin to build a robust and scalable application with an intuitive user interface. Integrated third-party APIs like Google Maps API and Google Places API to allow users to fetch their current location, input their destination, and match with a driver seamlessly.\nImplemented Stripe for secure and efficient payments, ensuring a smooth transaction process. Followed best practices of Test-Driven Development (TDD) to maintain stability and optimize app performance. Utilized SOAP protocols for certain backend communications, ensuring reliable data exchange.",
      appPhotos: AppConstants.hycabImage,
      projectLink: "",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.java
      ],
    ),
    ProjectModel(
      project: "Python",
      title: "Personal Face and Emotion Recognition",
      description:
          "The model will recognize each face and identify their name based on the trained model. CNN is used for training the dataset.",
      appPhotos: AppConstants.pythonDocumentAnalyserImage,
      projectLink: "https://github.com/AgnelSelvan/Emotion-Recognition.git",
      techUsed: [
        TechnologyConstants.python,
        TechnologyConstants.flask,
      ],
      buttonText: "Repo Link",
    ),
    ProjectModel(
      project: "Android App",
      title: "VPN Browser",
      description:
      "Contracted on Upwork to resolve UI, AppActivity, and dependency issues for a VPN application.\nOptimized the user interface by removing redundant UI elements and enhancing responsiveness and visual consistency across devices.\nCreated a BaseActivity class to manage system-wide activity processes and lifecycle, improving code reusability and reducing redundancy.\nUpdated and optimized packages handling network calls, ensuring stable and efficient connectivity.\nLeveraged Java and Kotlin for Android development, following best practices in mobile app development, troubleshooting, and optimization.",
      appPhotos: AppConstants.androidImage,
      projectLink: "",
      techUsed: [
        TechnologyConstants.java,
        TechnologyConstants.kotlin,
        TechnologyConstants.android
      ],
    ),
    ProjectModel(
      project: "Backend",
      title: "Logistics App Backend",
      description: "RESTful API for a logistics/courier service built with NestJS, featuring authentication, order creation, tracking, and user management.",
      appPhotos: AppConstants.nestJsImage,
      projectLink: "https://github.com/damian-tochi/courier-service",
      techUsed: [
        TechnologyConstants.nestJs,
        TechnologyConstants.javascript,
      ],
      buttonText: "Repo Link",
    ),
  ];

}
