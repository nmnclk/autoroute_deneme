import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

part 'counter_state.dart';
//developer

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 0, isLogin: false)) {
    setInitial();
  }
  setInitial() {
    developer.log("setInitial");
    Timer.periodic(const Duration(seconds: 2), (timer) {
      emit(state.copyWith(counter: state.counter + 1));
    });
  }

  logOut() {
    developer.log("logout");
    emit(state.copyWith(isLogin: false));
  }

  login() {
    developer.log("login");
    emit(state.copyWith(isLogin: true));
  }
}
