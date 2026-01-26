import 'package:bookly/core/routes/app_router.dart';
import 'package:bookly/core/utils/app_assets.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.logo, height: 25),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(AppRouter.kSearchView);
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
