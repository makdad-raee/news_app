import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);
}
