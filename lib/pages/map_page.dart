import 'package:auto_route/auto_route.dart';
import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';
import 'package:autoroute_deneme/routes/app_router.gr.dart';
import 'package:autoroute_deneme/routes/route_names.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("map page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              context.tabsRouter.setActiveIndex(1);
            },
            child: const Text("go scan"),
          ),
          TextButton(
            onPressed: () {
              context.router.pushNamed(RouteNames.detail);
            },
            child: const Text("detail"),
          ),
          TextButton(
            onPressed: () {
              context.router.pushNamed(RouteNames.login);
            },
            child: const Text("login"),
          ),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text("counter : ${state.counter}");
            },
          )
        ],
      )),
    );
  }
}
