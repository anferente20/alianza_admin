import 'package:alianza_admin/core/constants/sidebar_constants.dart';
import 'package:alianza_admin/core/palette/palette.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.menuItem, required this.onTap});

  final SideBarOption menuItem;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(menuItem.icon, color: Palette.blue),
          onTap: onTap,
          title: Text(
            menuItem.title,
            style: const TextStyle(fontSize: 16, color: Palette.blueGrey),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios_outlined, color: Palette.blue),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
