import '../../app/modules/register_module/register_page.dart';
import '../../app/modules/register_module/register_bindings.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/chat_module/chat_bindings.dart';
import 'package:pea_chat/app/modules/chat_module/chat_page.dart';

import '../../app/modules/add_friend_module/add_friend_bindings.dart';
import '../../app/modules/add_friend_module/add_friend_page.dart';
import '../../app/modules/contacts_module/contacts_bindings.dart';
import '../../app/modules/contacts_module/contacts_page.dart';
import '../../app/modules/create_chat_module/create_chat_bindings.dart';
import '../../app/modules/create_chat_module/create_chat_page.dart';
import '../../app/modules/forgot_password_module/forgot_password_bindings.dart';
import '../../app/modules/forgot_password_module/forgot_password_page.dart';
import '../../app/modules/friend_request_module/friend_request_bindings.dart';
import '../../app/modules/friend_request_module/friend_request_page.dart';
import '../../app/modules/home_module/home_bindings.dart';
import '../../app/modules/home_module/home_page.dart';
import '../../app/modules/landing_module/landing_bindings.dart';
import '../../app/modules/landing_module/landing_page.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import '../../app/modules/register_module/register_bindings.dart';
import '../../app/modules/register_module/register_page.dart';
import '../../app/modules/search_module/search_bindings.dart';
import '../../app/modules/search_module/search_page.dart';
import '../../app/modules/settings_module/settings_bindings.dart';
import '../../app/modules/settings_module/settings_page.dart';
import '../../app/modules/splash_module/splash_bindings.dart';
import '../../app/modules/splash_module/splash_page.dart';
import '../../app/modules/user_module/user_bindings.dart';
import '../../app/modules/user_module/user_page.dart';

part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => LandingPage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: Routes.CHAT + '/:id',
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.CONTACTS,
      page: () => ContactsPage(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: Routes.USER + '/:idUser',
      page: () => UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.CREATE_CHAT,
      page: () => CreateChatPage(),
      binding: CreateChatBinding(),
    ),
    GetPage(
      name: Routes.ADD_FRIEND,
      page: () => AddFriendPage(),
      binding: AddFriendBinding(),
    ),
    GetPage(
      name: Routes.FRIEND_REQUEST,
      page: () => FriendRequestPage(),
      binding: FriendRequestBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
