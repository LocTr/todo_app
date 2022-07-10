# todo_app

Manabie Mobile Tech Challenge

## Structure
#### Data Access Layer
`packages/tasks_api` <br/>
`packages/packages/hive_tasks_api`
#### Domain Layer
`packages/tasks_repository`
#### Application Layer
this

## To run this app
1. clone this repo

2. Run this line in terminal

    `flutter run`

    or <br/> 
    `flutter run lib/main.dart`

## To test this app

run these lines in terminal to test the corresponding unit

1. Data Access Layer

   `flutter test packages\tasks_api\test\tasks_api_test.dart` <br/>
   `flutter test packages\hive_tasks_api\test\hive_tasks_api_test.dart` 

2. Domain layer

   `flutter test packages\tasks_repository\test\tasks_repository_test.dart`

3. Application Layer

   `flutter test test\home\cubit\home_cubit_test.dart` <br/>


   `flutter test test\new_task\bloc\add_task_bloc_test.dart` <br/>
   `flutter test test\new_task\bloc\add_task_event_test.dart` <br/>
   `flutter test test\new_task\bloc\add_task_state_test.dart` 

   `flutter test test\tasks_view\bloc\tasks_view_bloc_test.dart` <br/>
   `flutter test test\tasks_view\bloc\tasks_view_event_test.dart` <br/>
   `flutter test test\tasks_view\bloc\tasks_view_state_test.dart` 

   

