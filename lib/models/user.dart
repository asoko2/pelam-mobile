import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.nama,
    required this.username,
    required this.keterangan,
    required this.level,
  });

  final int id;
  final String nama;
  final String username;
  final String keterangan;
  final String level;

  factory User.fromJson(Map<String, dynamic> data) {
    var user = User(
      id: data['id'],
      nama: data['nama'],
      username: data['username'],
      keterangan: data['keterangan'] ?? '',
      level: data['level'],
    );
    return user;
  }

  @override
  List<Object?> get props => [
        id,
        nama,
        username,
        keterangan,
        level,
      ];

  static const empty = User(
    id: 0,
    nama: '-',
    username: '-',
    keterangan: '-',
    level: '-',
  );
}
