import 'package:auto_route/auto_route.dart';
import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("login ${state.isLogin} counter ${state.counter}"),
              FilledButton(
                onPressed: () {
                  context.read<CounterCubit>().logOut();
                },
                child: const Text("Log Out"),
              ),
            ],
          );
        },
      )),
    );
  }
}
