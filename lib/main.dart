import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/cach/functions/api_service.dart';
import 'package:anime_app/core/supabase_file.dart';
import 'package:anime_app/core/utils/app_router.dart';
import 'package:anime_app/features/authentication/presentation/view_models/signin_cubit/signin_cubit.dart';
import 'package:anime_app/features/authentication/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:anime_app/features/authentication/presentation/view_models/update_cubit/update_cubit.dart';
import 'package:anime_app/features/authentication/repos/auth_home_repo_imp.dart';
import 'package:anime_app/features/home/presentation/view_models/genres_anime_cubit/genres_anime_cubit.dart';
import 'package:anime_app/features/home/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{

WidgetsFlutterBinding.ensureInitialized();
  await supabaseInit();
  await CacheHelper.init();
  
  runApp(const AnimeApp());

}

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(create: (context)=>SigninCubit(AuthoHomeRepoImp())),
        BlocProvider(create: (context)=>SignupCubit(AuthoHomeRepoImp())),
        BlocProvider(create: (context)=>UpdateCubit(AuthoHomeRepoImp())),
        BlocProvider(create: (context) => GenresAnimeCubit(HomeRepoImp(api: ApiService(dio: Dio()))),)
      ],
      child: MaterialApp.router(
        theme: ThemeData(brightness:Brightness.dark ),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}