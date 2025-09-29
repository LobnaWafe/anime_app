import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/presentation/views/signin_view.dart';
import 'package:anime_app/features/authentication/presentation/views/signup_view.dart';
import 'package:anime_app/features/home/presentation/views/home_view.dart';
import 'package:anime_app/features/profile/views/edit_profile_name.dart';
import 'package:anime_app/features/profile/views/profile_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kSignUpView = "/signup_view";
  static final kProfile = "/profile_view";
  static final kHomeView="/home_view";
  static final kNameEditView="/name_edit_view";

  static final router = GoRouter(
     initialLocation: CacheHelper.sharedPreferences.getString("user") == null?
     "/":
     kHomeView,

    routes: [
      GoRoute(path: '/', builder: (context, state) => const SigninView()),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kProfile,
        builder: (context, state) =>
            ProfileView(),
      ),
       GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
  GoRoute(
        path: kNameEditView,
        builder: (context, state) => EditProfileName(authModel:state.extra as AuthModel),
      ),

    ],
  );
}
