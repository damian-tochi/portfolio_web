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
      project: "Flutter",
      title: "GarmentCare App",
      description:
      "Built and maintained a cross-platform mobile application for GarmentCare using Flutter, delivering a responsive experience across Android and iOS. Focused on scalable architecture, performance optimization, and seamless API integration to support a reliable production application.",
      appPhotos: AppConstants.garmentCareImage,
      projectLink: "https://play.google.com/store/apps/details?id=com.mobile.garmentcareltd&hl=en",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.android,
        TechnologyConstants.swift,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Playstore Link",
    ),
    ProjectModel(
      project: "Android",
      title: "Goldbucks App",
      description:
      "Developed and maintained core Android features for Goldbucks, improving app stability, performance, and user experience. Collaborated with backend teams to deliver secure financial workflows and production-ready releases.",
      appPhotos: AppConstants.goldbucksImage,
      projectLink: "https://play.google.com/store/apps/details?id=ng.alertmfb.alertsavings&hl=en",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Playstore Link",
    ),
    ProjectModel(
      project: "Flutter",
      title: "EasySpend App",
      description:
      "Built a cross-platform expense management application with Flutter, featuring intuitive budgeting tools, transaction tracking, and a responsive user interface designed for a seamless mobile experience.",
      appPhotos: AppConstants.easySpendImage,
      projectLink: "https://play.google.com/store/search?q=easyspend&c=apps&hl=en",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.android,
        TechnologyConstants.swift,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Playstore Link",
    ),
    ProjectModel(
      project: "Android",
      title: "Movemate App UI ",
      description:
      "Recreated the Movemate concept from a Musemind design using native Android (Kotlin), showcasing modern Android architecture, Fragments, Shared ViewModels, custom navigation, and polished animations.",
      appPhotos: AppConstants.movemateImage,
      projectLink: "https://github.com/damian-tochi/Movemate",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
    ProjectModel(
      project: "Android",
      title: "Pupil Manager(Offline First)",
      description:
      "Built an offline-first Android application using Kotlin, enabling users to manage pupil records without network connectivity. Implemented local persistence, synchronization, and conflict resolution for a seamless offline-to-online experience.",
      appPhotos: AppConstants.androidImage,
      projectLink: "https://github.com/damian-tochi/PupilManager",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
    ProjectModel(
      project: "Frontend",
      title: "Nexium Finance",
      description:
      "Developed the frontend of a Web3 DeFi platform using TypeScript. Built responsive interfaces and integrated blockchain-powered workflows while emphasizing security, scalability, and performance.",
      appPhotos: AppConstants.nexiumImage,
      projectLink: "https://www.nexium.finance/",
      techUsed: [
        TechnologyConstants.nestJs,
        TechnologyConstants.javascript,
        TechnologyConstants.typeScript,
      ],
      internalLink: true,
      buttonText: "Website Link",
    ),
    ProjectModel(
      project: "Frontend",
      title: "Futur Exchange",
      description:
          "Contributed to the frontend development of an internal fintech platform, building responsive interfaces, integrating APIs, and streamlining user workflows. Additional project details remain confidential under NDA.",
      appPhotos: AppConstants.nestJsImage,
      projectLink: "",
      techUsed: [
        TechnologyConstants.nestJs,
        TechnologyConstants.typeScript,
      ],
    ),
    ProjectModel(
      project: "Flutter",
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
      project: "Flutter",
      title: "uduX Music Player",
      description:
          "Architected the mobile foundation for a music streaming platform using Flutter and native Android (Kotlin). Optimized streaming performance, reduced latency, and built reusable cross-platform infrastructure while collaborating closely with product and design teams.",
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
      project: "Android",
      title: "Grynd",
      description:
          "Developed native Android features for an agri-tech platform, implementing scalable architecture, offline caching, automated testing, and intuitive user experiences to improve reliability in low-connectivity environments.",
      appPhotos: AppConstants.gryndApp,
      projectLink: "",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.firebase,
        TechnologyConstants.kotlin,
      ],
    ),
    ProjectModel(
      project: "Android & iOS",
      title: "Delonifera TV",
      description: "Developed premium content access controls across Android and iOS, implementing subscription-based viewing restrictions and ad-supported freemium experiences while maintaining a seamless playback experience.",
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
      project: "Android",
      title: "My School Library",
      description:
          "Modernized an existing Android application by redesigning the UI, improving layout scalability, integrating Flutterwave and Stripe payments, and enhancing document upload functionality for administrators.",
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
      project: "Android",
      title: "Blue Call",
      description: "Restored and optimized real-time voice calling and messaging using Sinch and Firebase, improving communication reliability, application performance, and overall user experience.",
      appPhotos: AppConstants.blueCallImage,
      projectLink: "https://play.google.com/store/apps/details?id=com.free.talk.alh.global.im&pcampaignid=web_share",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.java,
      ],
      internalLink: true,
      buttonText: "Product Link",
    ),
    ProjectModel(
      project: "Android",
      title: "HyCab",
      description:
          "Architected and developed a ride-hailing application with real-time location tracking, Google Maps integration, driver matching, and secure Stripe payments, emphasizing scalability and performance.",
      appPhotos: AppConstants.hycabImage,
      projectLink: "",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.java
      ],
    ),
    ProjectModel(
      project: "Python",
      title: "Document Chat App",
      description:
          "Built an AI-powered document assistant using Python, Flask, Hugging Face, and FuzzyWuzzy, enabling users to upload documents and ask natural language questions with contextual responses.",
      appPhotos: AppConstants.pythonDocumentAnalyserImage,
      projectLink: "https://github.com/damian-tochi/analize_me",
      techUsed: [
        TechnologyConstants.python,
        TechnologyConstants.flask,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
    ProjectModel(
      project: "Android",
      title: "VPN Browser",
      description:
      "Modernized an Android VPN application by improving UI consistency, refactoring application architecture, resolving dependency issues, and optimizing networking components for greater stability.",
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
      description: "Built a RESTful logistics API with NestJS, implementing authentication, shipment management, real-time tracking, and user management using scalable backend architecture.",
      appPhotos: AppConstants.nestJsImage,
      projectLink: "https://github.com/damian-tochi/courier-service",
      techUsed: [
        TechnologyConstants.nestJs,
        TechnologyConstants.javascript,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
  ];

  static List<ProjectModel> libraries = [
    ProjectModel(
      project: "Android",
      title: "NameForge",
      description:
      "NameForge is a high-performance Kotlin Multiplatform library that generates intelligent, aesthetically balanced, low-collision username suggestions in real-time. Built for modern applications requiring unique, memorable, and brandable digital identities.",
      appPhotos: AppConstants.androidImage,
      projectLink: "https://github.com/damian-tochi/NameForge",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
    ProjectModel(
      project: "Android",
      title: "CommPath",
      description:
      "A lightweight Android Kotlin library that simplifies communication and transactions between modules in multi-module applications through a single entry-point class.",
      appPhotos: AppConstants.androidImage,
      projectLink: "https://github.com/damian-tochi/CommPath",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Playstore Link",
    ),
    ProjectModel(
      project: "Android",
      title: "NFCfy",
      description:
      "NFCfy SDK abstracts Android's NFC APIs into a clean, coroutine-friendly, lifecycle-safe interface. It enables developers to scan, read, and write NFC tags with minimal setup and predictable behavior across devices.",
      appPhotos: AppConstants.androidImage,
      projectLink: "https://github.com/damian-tochi/NFCfy",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
    ProjectModel(
      project: "Android",
      title: "QuickAnim",
      description:
      "A powerful, lightweight Android animation library written in Kotlin that provides easy-to-use animation utilities and pre-built animations for Views and RecyclerViews. QuickAnim simplifies complex animations with a clean, fluent API.",
      appPhotos: AppConstants.androidImage,
      projectLink: "https://github.com/damian-tochi/QuickAnim",
      techUsed: [
        TechnologyConstants.android,
        TechnologyConstants.kotlin,
      ],
      internalLink: true,
      buttonText: "Repo Link",
    ),
  ];

}
