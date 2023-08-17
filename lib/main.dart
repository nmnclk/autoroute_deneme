import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';
import 'package:autoroute_deneme/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = CounterCubit();
    return BlocProvider(
      create: (context) => counterCubit,
      child: MaterialApp.router(
        routerConfig: AppRouter(
          counterCubit: counterCubit,
        ).config(),
      ),
    );
  }
}
