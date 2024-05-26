import 'package:do_it/views/home_view/body_view.dart';
import 'package:flutter/material.dart';

import '../app_bar_decoration/app_bar_decoration.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppBarDecoration(),
        BodyView(),
      ],
    );
  }
}
