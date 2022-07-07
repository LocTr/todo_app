import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_view_state.dart';

class TabViewCubit extends Cubit<TabViewState> {
  TabViewCubit() : super(const TabViewState(currentTab: HomeTab.all));

  // void setTab(HomeTab newTab) => emit(TabViewState(currentTab: newTab));

  void setTab(HomeTab newTab) {
    emit(TabViewState(currentTab: newTab));
  }
}
