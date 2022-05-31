part of 'pages.dart';

class PermohonanSuratPage extends StatefulWidget {
  const PermohonanSuratPage({Key? key, required this.nik}) : super(key: key);

  final String nik;

  @override
  State<PermohonanSuratPage> createState() => _PermohonanSuratPageState();
}

class _PermohonanSuratPageState extends State<PermohonanSuratPage> {
  List<Map<String, dynamic>> surat = [
    {
      'no': 1,
      'tanggal': '2022/04/03',
      'surat': 'SKTM',
      'status': 'Belum Diproses'
    },
    {
      'no': 2,
      'tanggal': '2022/04/05',
      'surat': 'SKCK',
      'status': 'Belum Diproses'
    },
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
    {'no': 3, 'tanggal': '2022/04/01', 'surat': 'SKU', 'status': 'Disetujui'},
  ];

  Pemohon? pemohonData;

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
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
                        MdiIcons.viewList,
                        size: 80,
                      ),
                      const Text(
                        'PERMOHONAN SURAT',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.69745,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: FutureBuilder(
                        future: API().getPemohonData(user.id),
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            var userData = snapshot.data;
                            pemohonData = Pemohon.fromJson(userData);
                            return FutureBuilder(
                              future: API().getSurat(pemohonData!.nik),
                              builder:
                                  (context, AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.hasData) {
                                  List surats = snapshot.data;
                                  return DataTable2(
                                      border: TableBorder.all(
                                          color: Colors.black, width: 1),
                                      columns: [
                                        DataColumn2(
                                            label: const Text('No'),
                                            fixedWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.115),
                                        DataColumn2(
                                            label: const Text('Tanggal'),
                                            fixedWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.27),
                                        DataColumn2(
                                            label: const Text('Surat'),
                                            fixedWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.255),
                                        DataColumn2(
                                            label: const Text('Status'),
                                            fixedWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.235),
                                      ],
                                      headingRowHeight: 30,
                                      rows: surats.isNotEmpty
                                          ? surats.asMap().entries.map((e) {
                                              return DataRow2(cells: [
                                                DataCell(Text(
                                                    (e.key + 1).toString())),
                                                DataCell(Text(
                                                    DateFormat('yyyy/MM/dd')
                                                        .format(DateTime.parse(e
                                                                .value[
                                                            'created_at'])))),
                                                DataCell(Text(
                                                    e.value['jenis_surat'])),
                                                DataCell(Text((e
                                                            .value['status'] ==
                                                        0)
                                                    ? 'Belum Diproses'
                                                    : (e.value['status'] == 1)
                                                        ? 'Disetujui'
                                                        : 'Sudah Diambil')),
                                              ]);
                                            }).toList()
                                          : [
                                              const DataRow2(cells: [
                                                DataCell(
                                                  Text('Belum ada data'),
                                                ),
                                                DataCell(
                                                  Text('Belum ada data'),
                                                ),
                                                DataCell(
                                                  Text('Belum ada data'),
                                                ),
                                                DataCell(
                                                  Text('Belum ada data'),
                                                ),
                                              ])
                                            ]);
                                } else {
                                  return const Center(
                                    child: SpinKitRing(
                                        color: primaryColor,
                                        lineWidth: 5,
                                        size: 25),
                                  );
                                }
                              },
                            );
                          } else {
                            return const Center(
                              child: SpinKitRing(
                                  color: primaryColor, lineWidth: 5, size: 25),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(MdiIcons.home, size: 36),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dataRow(String name, String value) {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child: Text(
            name,
            style: blackTextFont.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Center(
          child: Text(
            ':',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          child: Text(
            value,
            style: blackTextFont.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
