import 'package:flutter/material.dart';
import 'package:mybookstore/pages/home/views/book_view.dart';
import 'package:mybookstore/pages/home/views/employee_view.dart';
import 'package:mybookstore/pages/home/views/home_view.dart';
import 'package:mybookstore/pages/home/views/my_profile_view.dart';

mixin HomeProvider {
  List<Widget> pages = [];

  void initPages(context) {
    // final translations = S.of(context);

    pages = [
      HomeView(),
      EmployeeView(),
      BookView(),
      MyProfile(),
    ];
  }
}
