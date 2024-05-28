import 'package:do_it/view_model/home_page_view_model/home_page_view_model.dart';
import 'package:do_it/views/home_view/body_view.dart';
import 'package:flutter/material.dart';

import '../app_bar_decoration/app_bar_decoration.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePageViewModel.getScreen;
  }
}
