import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      currentIndex: index,
      elevation: 30,
      items: const [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.home,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
              size: 30,
            ))
      ],
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
    );
  }
}
