part of 'pemohon_bloc.dart';

abstract class PemohonEvent extends Equatable {
  const PemohonEvent();

  @override
  List<Object> get props => [];
}

class LoadPemohon extends PemohonEvent {
  const LoadPemohon(this.pemohon);

  final Pemohon pemohon;

  @override
  List<Object> get props => [pemohon];
}
