import 'package:e_commerce_app/register_featcher/presentation/widgets/custom_text_field.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';

buildCustomAppBar() {
  return AppBar(
    title: SizedBox(
      height: 50,
      child: CustomTextField(
        hint: 'Search',
        prefixIcon: Icons.search,
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.heart_broken)),
      wSizedBox,
      IconButton(onPressed: () {}, icon: const Icon(Icons.notification_add)),
    ],
  );
}
