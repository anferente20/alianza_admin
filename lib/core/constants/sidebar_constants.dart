import 'package:flutter/material.dart';

class SideBarOption {
  final String title;
  final String link;
  final IconData icon;

  const SideBarOption(
      {required this.title, required this.link, required this.icon});
}

const List<SideBarOption> sidebarOptions = [
  SideBarOption(title: 'Clients', link: '/', icon: Icons.person_3_outlined),
  SideBarOption(
      title: 'Client look history',
      link: '/client-history',
      icon: Icons.history_edu_outlined),
  SideBarOption(
      title: 'Emergency PIN configuration',
      link: '/pin',
      icon: Icons.password_outlined),
  SideBarOption(
      title: 'Emergency PIN history',
      link: '/pin-history',
      icon: Icons.history_outlined),
];
