import 'package:auto_route/auto_route.dart';
import 'package:autoroute_deneme/data/cubit/counter_cubit.dart';
import 'package:autoroute_deneme/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool dialogShowed = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        int sec = 2;
        //full screen dialog
        if (state.counter < sec && !dialogShowed) {
          showDialog(
            context: context,
            builder: (context) => _loadingDialog(),
            barrierDismissible: false,
            useRootNavigator: false,
          );
          dialogShowed = true;
        } else if (state.counter >= sec && dialogShowed) {
          context.router.pop();
          dialogShowed = false;
        }
      },
      child: AutoTabsScaffold(
        routes: const [
          MapRoute(),
          ScanRoute(),
          ProfileRoute(),
        ],
        transitionBuilder: (context, child, animation) => child,
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: const [
              NavigationDestination(label: 'Map', icon: Icon(Icons.map)),
              NavigationDestination(label: 'Tara', icon: Icon(Icons.qr_code)),
              NavigationDestination(label: 'Profile', icon: Icon(Icons.person)),
            ],
          );
        },
      ),
    );
  }

  _loadingDialog() {
    return const Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text("Loading..."),
            ],
          ),
        ),
      ),
    );
  }
}
