import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/home/cubit/tab_view_cubit.dart';

void main() {
  group('TabViewCubit', () {
    TabViewCubit buildCubit() => TabViewCubit();

    group('constructor', () {
      test('wroks properly', () {
        expect(buildCubit, returnsNormally);
      });

      test('has correct initial state', () {
        expect(buildCubit().state,
            equals(const TabViewState(currentTab: HomeTab.all)));
      });
    });

    group('setTab', () {
      blocTest<TabViewCubit, TabViewState>(
          'set tab to different views| completed view',
          build: buildCubit,
          act: (cubit) => cubit.setTab(HomeTab.completed),
          expect: () => [
                const TabViewState(currentTab: HomeTab.completed),
              ]);
      blocTest<TabViewCubit, TabViewState>(
          'set tab to different views| completed view',
          build: buildCubit,
          act: (cubit) => cubit.setTab(HomeTab.uncompleted),
          expect: () => [
                const TabViewState(currentTab: HomeTab.uncompleted),
              ]);
    });
  });
}
