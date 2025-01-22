import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/cubit/cubit/quraan_page_state.dart';

class QuranPageCubit extends Cubit<QuranPageState> {
  QuranPageCubit() : super(QuranPageInitial()); 

  
  void setPage(int page) {
    emit(QuranPageLoaded(currentPage: page));
  }
}
