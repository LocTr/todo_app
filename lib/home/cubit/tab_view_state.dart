part of 'tab_view_cubit.dart';

enum HomeTab {
  all,
  completed,
  uncompleted,
  add,
}

class TabViewState extends Equatable {
  const TabViewState({required this.currentTab});

  final HomeTab currentTab;

  @override
  List<Object> get props => [currentTab];
}
