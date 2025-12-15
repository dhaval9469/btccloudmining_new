import 'package:btccloudmining/dashboard/page/auth/signin_reward_page.dart';
import 'package:btccloudmining/dashboard/page/auth/singin_page.dart';
import 'package:btccloudmining/dashboard/page/bottom.dart';
import 'package:btccloudmining/dashboard/page/home.dart';
import 'package:btccloudmining/dashboard/page/intro/country_page.dart';
import 'package:btccloudmining/dashboard/page/intro/intro_page.dart';
import 'package:btccloudmining/dashboard/page/top_miner.dart';
import 'package:btccloudmining/dashboard/page/widgets/customer_support.dart';
import 'package:btccloudmining/dashboard/page/widgets/exit_page.dart';
import 'package:btccloudmining/dashboard/page/widgets/faq_page.dart';
import 'package:btccloudmining/dashboard/page/widgets/language_page.dart';
import 'package:btccloudmining/dashboard/page/widgets/mining_record.dart';
import 'package:btccloudmining/dashboard/page/widgets/payout_history.dart';
import 'package:btccloudmining/dashboard/page/widgets/payout_page.dart';
import 'package:btccloudmining/dashboard/page/widgets/privacy_policy.dart';
import 'package:btccloudmining/dashboard/page/widgets/profile_page.dart';
import 'package:btccloudmining/dashboard/page/widgets/refer_friends.dart';
import 'package:btccloudmining/dashboard/page/widgets/store_info.dart';
import 'package:btccloudmining/dashboard/page/widgets/view_active_asics.dart';
import 'package:btccloudmining/dashboard/splash.dart';
import 'package:get/get.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  static const String splash = "/splash";
  static const String home = "/home";
  static const String bottom = "/bottom";
  static const String profilePage = "/profilePage";
  static const String miningRecord = "/miningRecord";
  static const String topMiner = "/topMiner";
  static const String viewActiveAsics = "/viewActiveAsics";
  static const String customerSupport = "/customerSupport";
  static const String privacyPolicy = "/privacyPolicy";
  static const String storeInfo = "/storeInfo";
  static const String payoutPage = "/payoutPage";
  static const String signInPage = "/signInPage";
  static const String signInRewardPage = "/signInRewardPage";
  static const String countryPage = "/countryPage";
  static const String introPage = "/introPage";
  static const String faqPage = "/faqPage";
  static const String exitPage = "/exitPage";
  static const String payoutHistory = "/payoutHistory";
  static const String languagePage = "/languagePage";
  static const String referFriendsPage = "/referFriendsPage";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: splash, page: () => const SplashPage(), transition: defaultTransition),
    GetPage(name: home, page: () => const HomePage(), transition: defaultTransition),
    GetPage(name: bottom, page: () => const BottomBarPage(), transition: defaultTransition),
    GetPage(name: profilePage, page: () => const ProfilePage(), transition: defaultTransition),
    GetPage(name: miningRecord, page: () => const MiningRecord(), transition: defaultTransition),
    GetPage(name: topMiner, page: () => TopMiner(), transition: defaultTransition),
    GetPage(name: viewActiveAsics, page: () => const ViewActiveAsics(), transition: defaultTransition),
    GetPage(name: customerSupport, page: () => const CustomerSupport(), transition: defaultTransition),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicy(), transition: defaultTransition),
    GetPage(name: storeInfo, page: () => const StoreInfo(), transition: defaultTransition),
    GetPage(name: payoutPage, page: () => const PayoutPage(), transition: defaultTransition),
    GetPage(name: signInPage, page: () => const SignInPage(), transition: defaultTransition),
    GetPage(name: signInRewardPage, page: () => const SignInRewardPage(), transition: defaultTransition),
    GetPage(name: countryPage, page: () => const CountryPage(), transition: defaultTransition),
    GetPage(name: introPage, page: () => const IntroPage(), transition: defaultTransition),
    GetPage(name: faqPage, page: () => const FaqPage(), transition: defaultTransition),
    GetPage(name: exitPage, page: () => const ExitPage(), transition: defaultTransition),
    GetPage(name: payoutHistory, page: () => const PayoutHistory(), transition: defaultTransition),
    GetPage(name: languagePage, page: () => const LanguagePage(), transition: defaultTransition),
    GetPage(name: referFriendsPage, page: () => const ReferFriendsPage(), transition: defaultTransition),
  ];
}
