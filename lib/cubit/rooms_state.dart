part of 'rooms_cubit.dart';

@immutable
abstract class RoomsState {}

class RoomsInitial extends RoomsState {}
class RoomSate  extends RoomsState{
  final int room;

  RoomSate(this.room);
}
class AdultSate  extends RoomsState{
  final int adult;

  AdultSate(this.adult);
}
class ChildrenSate  extends RoomsState{
  final int children;

  ChildrenSate(this.children);
}
class SwitchSate  extends RoomsState{
  final bool switchBt;

  SwitchSate(this.switchBt);
}
class ChangeDateState  extends RoomsState{
 final String startDate;
 final String endDate;

  ChangeDateState(this.startDate,this.endDate);
}
