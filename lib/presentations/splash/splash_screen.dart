import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer tempTimer = Timer(const Duration(seconds: 1), () {});

  /* int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tempTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    log('Current Route: ${GoRouter.of(context).location}');

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      tempTimer = Timer(const Duration(seconds: 3), () {
        context.go('/home');
        tempTimer.cancel();
      });
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
          /* image: DecorationImage(
            image: NetworkImage('N/A')
          ) */
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}