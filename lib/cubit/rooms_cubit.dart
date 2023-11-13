import 'package:bloc/bloc.dart';
import 'package:flutter/src/material/date.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(RoomsInitial());
  int room = 0;
  int adults = 0;
  int children = 0;
  bool switchBt=false;
  String startDate='2023-10-10';
  String endDate='2023-10-11';
  void incrementRooms() {
int newRooms = room++;
emit(RoomSate(newRooms));
  }

  void decrementRooms() {
    if(room!=0){
    int newRooms =room--;
emit(RoomSate(newRooms));}
  }
  void incrementAdults() {
    int newAdults = adults++;
    emit(AdultSate(newAdults));
  }

  void decrementAdults() {
    if(adults!=0){
      int newAdults =adults--;
      emit(AdultSate(newAdults));}
  }
  void incrementChildren() {
    int newChildren = children++;
    emit(ChildrenSate(newChildren));
  }

  void decrementChildren() {
    if(children!=0){
      int newChildren =children--;
      emit(ChildrenSate(newChildren));}
  }

  void changeSwitch(bool value) {

    switchBt = value;

    emit(SwitchSate(switchBt));
  }

  void selectDate(DateTimeRange? dateTimeRange) {
    startDate = DateFormat('yyyy-MM-dd').format(dateTimeRange!.start);
    endDate = DateFormat('yyyy-MM-dd').format(dateTimeRange.end);
    emit(ChangeDateState(startDate,endDate));
  }
}


