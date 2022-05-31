import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<PageEvent>((event, emit) {
      if (event is GoToSignInPage) {
        emit(OnSignInPage());
      } else if (event is GoToSignUpPage) {
        emit(OnSignUpPage());
      } else if (event is GoToHomePage) {
        emit(OnHomePage());
      }
    });
  }
}
