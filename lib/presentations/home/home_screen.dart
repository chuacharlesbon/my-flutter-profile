import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myflutterprofile/core/enums/state_status_enums.dart';
//import 'package:myflutterprofile/core/utils/change_favicon.dart';
import 'package:myflutterprofile/presentations/home/bottom_nav_bar.dart';
import 'package:myflutterprofile/presentations/home/cubits/home_cubit.dart';
import 'package:myflutterprofile/resources/constants/urls.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Current Route: ${GoRouter.of(context).location}');
    final homeCubit = GetIt.instance<HomeCubit>();
    homeCubit.fetchEvent();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state.status != StateStatus.loaded) {
              return const Center(
                child: RepaintBoundary(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CircularProgressIndicator.adaptive()),
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'My Profile',
                  ),
                  Text(
                    state.itemA['message'] ?? "",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        configs: navbarConfigs,
        onTap: (index) {
          //
        },
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
