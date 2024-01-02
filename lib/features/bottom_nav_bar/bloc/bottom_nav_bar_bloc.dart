import 'dart:async';

import 'package:deltainformatics/features/bottom_nav_bar/bloc/bottom_nav_bar_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_bar_events.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvents,BottomNavBarStates>{
  BottomNavBarBloc (): super(const BottomNavBarStates()){
    on<BottomNavBarEvents>(changeIndex);
  }
  FutureOr<void>  changeIndex(BottomNavBarEvents event, Emitter<BottomNavBarStates> emit){
    if(event is BottomNavBarClick ){
      emit(BottomNavBarStates(currentIndex: event.index));
    }
  }
}