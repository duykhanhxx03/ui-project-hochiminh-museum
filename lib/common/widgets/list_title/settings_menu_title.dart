import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class TSettingsMenuTitle extends StatelessWidget {
  const TSettingsMenuTitle(
      {Key? key,
      required this.title,
      required this.icon,
      required this.subtitle,
      this.trailing,
      required this.onPressed})
      : super(key: key);

  final String title;
  final IconData icon;
  final String subtitle;
  final Widget? trailing;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onPressed,
    );
  }
}
