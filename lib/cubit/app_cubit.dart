import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIntialState());
}
