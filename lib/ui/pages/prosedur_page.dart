part of 'pages.dart';

class ProsedurPage extends StatelessWidget {
  const ProsedurPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'KARANGTINGGIL',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    const Icon(
                      MdiIcons.information,
                      size: 80,
                    ),
                    const Text(
                      'PROSEDUR',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7774,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          margin: const EdgeInsets.only(top: 130),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: Text(
                                        '1.',
                                        style: blackTextFont.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text('Pendaftaran',
                                          style: blackTextFont.copyWith(
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: const Text(
                                        'Pemohon surat melakukan pendaftaran kemudian Login menggunakan username dan password',
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: Text(
                                        '2.',
                                        style: blackTextFont.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text('Mengisi Data',
                                          style: blackTextFont.copyWith(
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: const Text(
                                          'Melengkapi data diri sesuai form dengan benar'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: Text(
                                        '3.',
                                        style: blackTextFont.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text('Mengajukan Surat Permohonan',
                                          style: blackTextFont.copyWith(
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: const Text(
                                        'Setelah mengisi data dengan benar dan lengkap, pemohon dapat mengajukan permohonan surat. Kemudian dikirim dan menunggu konfirmasi dari petugas.',
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: const Icon(MdiIcons.home, size: 36),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
