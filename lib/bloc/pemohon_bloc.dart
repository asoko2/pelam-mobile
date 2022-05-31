import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pelam/models/models.dart';

part 'pemohon_event.dart';
part 'pemohon_state.dart';

class PemohonBloc extends Bloc<PemohonEvent, PemohonState> {
  PemohonBloc() : super(PemohonInitial()) {
    on<PemohonEvent>((event, emit) {
      if (event is LoadPemohon) {
        emit(PemohonLoaded(event.pemohon));
      }
    });
  }
}
