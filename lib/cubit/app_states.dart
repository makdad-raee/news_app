abstract class AppState {}

class AppIntialState extends AppState {}

class AppChangeModeState extends AppState {}

class NewsSearchLoadingState extends AppState {}

class NewsSearchSuccessState extends AppState {}

class NewsSearchErrorState extends AppState {
  final String error;

  NewsSearchErrorState({required this.error});
}
