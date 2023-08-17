import 'package:auto_route/auto_route.dart';
import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scan page"),
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text("counter ${state.counter}");
        },
      )),
    );
  }
}
