
import 'package:anime_app/features/search/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
 
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        BlocProvider.of<SearchCubit>(context).getSearchAnimeList(animeName: value);
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        prefixIcon: Icon(Icons.search),
        hintText: "Search",
        border: buildOutLineBorder(),
        focusedBorder: buildOutLineBorder()
      ),
    );
  }

  OutlineInputBorder buildOutLineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: const Color.fromARGB(255, 215, 214, 214))
      );
  }
}
