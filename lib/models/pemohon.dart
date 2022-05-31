import 'package:equatable/equatable.dart';

class Pemohon extends Equatable {
  const Pemohon({
    required this.id,
    required this.nama,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.kewarganegaraan,
    required this.nik,
    required this.agama,
    required this.pekerjaan,
    required this.telpon,
    required this.alamat,
    required this.kk,
    required this.kkLink,
  });

  final int id;
  final String nama;
  final String tempatLahir;
  final String tanggalLahir;
  final String jenisKelamin;
  final String kewarganegaraan;
  final String nik;
  final String agama;
  final String pekerjaan;
  final String telpon;
  final String alamat;
  final String kk;
  final String kkLink;

  factory Pemohon.fromJson(Map<String, dynamic> data) {
    var user = Pemohon(
      id: data['pemohon']['id'],
      nama: data['pemohon']['nama'],
      tempatLahir: data['pemohon']['tempat_lahir'] ?? '',
      tanggalLahir: data['pemohon']['tanggal_lahir'] ?? '',
      jenisKelamin: data['pemohon']['jenis_kelamin'] ?? '',
      kewarganegaraan: data['pemohon']['kewarganegaraan'] ?? '',
      nik: data['pemohon']['nik'] ?? '',
      agama: data['pemohon']['agama'] ?? '',
      pekerjaan: data['pemohon']['pekerjaan'] ?? '',
      telpon: data['pemohon']['telpon'] ?? '',
      alamat: data['pemohon']['alamat'] ?? '',
      kk: data['pemohon']['kk'] ?? '',
      kkLink: (data['pemohon']['kk'] != '')
          ? 'http://10.0.2.2:3333/uploads/${data['pemohon']['kk']}'
          : '',
    );
    return user;
  }

  @override
  List<Object?> get props => [
        id,
        nama,
        tempatLahir,
        tanggalLahir,
        jenisKelamin,
        kewarganegaraan,
        nik,
        agama,
        pekerjaan,
        telpon,
        alamat,
        kk,
        kkLink,
      ];
}
