import 'package:alianza_admin/core/constants/sidebar_constants.dart';
import 'package:alianza_admin/ui/widgets/tiles/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          children: [
            Image.asset('assets/imgs/logo.png'),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: sidebarOptions.length,
                itemBuilder: (context, index) {
                  return CustomListTile(
                      menuItem: sidebarOptions[index],
                      onTap: () {
                        context.push(sidebarOptions[index].link);
                      });
                },
              ),
            )
          ],
        ));
  }
}
