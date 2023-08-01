import 'package:bloc/bloc.dart';
import 'package:myflutterprofile/presentations/about/bloc/about_event.dart';
import 'package:myflutterprofile/presentations/about/bloc/about_state.dart';
import 'package:myflutterprofile/presentations/about/datasource/about_repository.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutLoadingState()) {
    final AboutRepository aboutRepository = AboutRepository();

    on<LoadAboutEvent>((event, emit) async {
      emit(AboutLoadingState());
      try {
        final data1 = await aboutRepository.getData1();
        final data2 = await aboutRepository.getData2(
          patronID: ''
        );
        emit(AboutLoadedState(data1, data2));
      } catch (e) {
        emit(AboutErrorState(e.toString()));
      }
    });

    on<GetDataEvent>((event, emit) async {
      try {
        final data1 = await aboutRepository.getData1();
        final data2 = await aboutRepository.getData2(
          patronID: ''
        );
        emit(AboutLoadedState(data1, data2));
      } catch (e) {
        emit(AboutErrorState(e.toString()));
      }
    });
  }
}