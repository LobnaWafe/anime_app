import 'package:anime_app/cach/functions/api_service.dart';
import 'package:anime_app/features/home/repos/home_repo_imp.dart';
import 'package:anime_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:anime_app/features/search/view_models/search_cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(HomeRepoImp(api: ApiService(dio: Dio()))),
      child: Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
