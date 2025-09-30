
import 'package:anime_app/features/home/presentation/view_models/genres_anime_cubit/genres_anime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralButton extends StatefulWidget {
   GeneralButton({
    super.key,
  });

  @override
  State<GeneralButton> createState() => _GeneralButtonState();
}

class _GeneralButtonState extends State<GeneralButton> {
 final List<String>order=["newest","oldest","favorites"];

 int buttonNumber=0;

 String buttonName="newest";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton.icon(
        onPressed: () {
        buttonName = order[(1+ buttonNumber)%3];
        buttonNumber =(1+ buttonNumber)%3;
        if(buttonNumber == 0){
          BlocProvider.of<GenresAnimeCubit>(context).getGenresAnime(order: "start_date",sort: "desc");
        }
        else if(buttonNumber == 1){
        BlocProvider.of<GenresAnimeCubit>(context).getGenresAnime(order: "start_date",sort: "asc");
        }
        else{
          BlocProvider.of<GenresAnimeCubit>(context).getGenresAnime(order:"favorites" ,sort:"desc" );
        }
        setState(() {
          
        });
        },
        icon: Icon(Icons.play_arrow, color: Colors.black),
        label: Text(buttonName, style: TextStyle(color: Colors.black)),
        style: TextButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 217, 213, 213),
          minimumSize: Size(50, 40), // هنا تحددي width و height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
