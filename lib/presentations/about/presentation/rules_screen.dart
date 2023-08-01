import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myflutterprofile/core/enums/state_status_enums.dart';
import 'package:myflutterprofile/presentations/about/bloc/about_bloc.dart';
import 'package:myflutterprofile/presentations/about/bloc/about_event.dart';
import 'package:myflutterprofile/presentations/about/bloc/about_state.dart';
//import 'package:myflutterprofile/core/utils/change_favicon.dart';
import 'package:myflutterprofile/presentations/home/bottom_nav_bar.dart';
import 'package:myflutterprofile/presentations/home/cubits/home_cubit.dart';
import 'package:myflutterprofile/resources/constants/urls.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({super.key, required this.title});

  final String title;

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void pageController(int index) {
    if(index == 0){
      context.go('/home');
    }else if(index == 1){
      context.go('/rules');
    }else if(index == 1){
      context.go('/book-now');
    }else if(index == 1){
      context.go('/profile');
    }else if(index == 1){
      context.go('/emergency');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => AboutBloc()..add(LoadAboutEvent()),
        child: BlocBuilder<AboutBloc, AboutState>(
          builder: (context, state) {
            if (state is AboutLoadingState) {
              return const Center(
                child: RepaintBoundary(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CircularProgressIndicator.adaptive()),
                ),
              );
            } else if (state is AboutErrorState) {
              return const Center(
                child: RepaintBoundary(
                  child: Text(
                    'Something went wrong',
                  ),
                ),
              );
            }else if (state is AboutLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'My Profile',
                    ),
                    Text(
                      state.data1['sample'] ?? "",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
            
          })
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        configs: navbarConfigs,
        onTap: (index) {
          pageController(index);
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
