abstract class NewsState {}

class NewsIntialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {
  final String error;

  NewsGetBusinessErrorState({required this.error});
}

class NewsGetSportLoadingState extends NewsState {}

class NewsGetSportSuccessState extends NewsState {}

class NewsGetSportErrorState extends NewsState {
  final String error;

  NewsGetSportErrorState({required this.error});
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;

  NewsGetScienceErrorState({required this.error});
}
