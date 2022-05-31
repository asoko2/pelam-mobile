part of 'pemohon_bloc.dart';

abstract class PemohonState extends Equatable {
  const PemohonState();

  @override
  List<Object> get props => [];
}

class PemohonInitial extends PemohonState {}

class PemohonLoaded extends PemohonState {
  const PemohonLoaded(this.pemohon);

  final Pemohon pemohon;

  @override
  List<Object> get props => [pemohon];
}
