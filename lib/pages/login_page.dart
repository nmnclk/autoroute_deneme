import 'package:auto_route/auto_route.dart';
import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';
import 'package:autoroute_deneme/routes/app_router.gr.dart';
import 'package:autoroute_deneme/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("login")),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("counter ${state.counter}"),
                const Icon(Icons.music_note),
                FilledButton(
                  onPressed: () {
                    context.read<CounterCubit>().login();
                    context.router.pushNamed(RouteNames.dashboard);
                  },
                  child: const Text("Login"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
