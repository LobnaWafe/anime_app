import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.detailName,
    required this.text,
    required this.icon,required this.onTap,
  });
  final String detailName;
  final String text;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Row( mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(detailName),
             Text(text,style: TextStyle(color: const Color.fromARGB(255, 89, 115, 128)),)]),
        ],
      ),
    );
  }
}

