import 'package:anime_app/features/favorit/views/favorit_view.dart';
import 'package:anime_app/features/home/presentation/view_models/genres_anime_cubit/genres_anime_cubit.dart';

import 'package:anime_app/features/home/presentation/widgets/home_view_body.dart';

import 'package:anime_app/features/profile/views/profile_view.dart';
import 'package:anime_app/features/search/views/search_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  


  List<Widget>views=[
  HomeViewBody(),
  SearchView(),
  FavoritView(),
  ProfileView(),
  ];

  int currentIndex=0;

@override
  void initState() {
    BlocProvider.of<GenresAnimeCubit>(context).getGenresAnime(order: "start_date",sort: "desc");
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(

        bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "fav"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),
        ],
        currentIndex: currentIndex,
        onTap: changeIndex,
        selectedItemColor: const Color.fromARGB(255, 143, 37, 29),
        unselectedItemColor: Colors.white,
        ),
        body:views.elementAt(currentIndex));
    
  }

  changeIndex(int value){
    setState(() {
      currentIndex=value;
    });
    
  }
}
