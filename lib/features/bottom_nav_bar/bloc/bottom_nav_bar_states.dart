import 'package:equatable/equatable.dart';

class BottomNavBarStates extends Equatable {
  final int currentIndex;

  const BottomNavBarStates({
    this.currentIndex = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [currentIndex];
}
