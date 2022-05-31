part of 'pages.dart';

class SktmPage extends StatefulWidget {
  const SktmPage({Key? key}) : super(key: key);

  @override
  State<SktmPage> createState() => _SktmPageState();
}

class _SktmPageState extends State<SktmPage> {
  final _formBuilderKey = GlobalKey<FormBuilderState>();
  late int _keteranganCount;
  late List<dynamic> keterangan;
  TextEditingController keperluanController = TextEditingController();

  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    _keteranganCount = 1;
    keterangan = [];
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 10) * 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'KARANGTINGGIL',
                          style: GoogleFonts.poppins(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        const Icon(
                          MdiIcons.account,
                          size: 70,
                        ),
                        const Text(
                          'SKTM',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 10) * 7,
                  width: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: API().getPemohonData(user.id),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          var userData = snapshot.data;
                          Pemohon pemohon = Pemohon.fromJson(userData);
                          return FormBuilder(
                            key: _formBuilderKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Table(
                                    border: TableBorder.all(
                                        color: Colors.black, width: 1),
                                    columnWidths: const {
                                      0: FractionColumnWidth(0.35),
                                      1: FractionColumnWidth(0.05),
                                      2: FractionColumnWidth(0.6)
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      dataRow(
                                          'Tanggal',
                                          DateFormat('yyyy-MM-dd')
                                              .format(DateTime.now())
                                              .toString()),
                                      dataRow('Nama', pemohon.nama),
                                      dataRow('NIK', pemohon.nik),
                                      dataRow(
                                          'Tempat Lahir', pemohon.tempatLahir),
                                      dataRow('Tanggal Lahir',
                                          pemohon.tanggalLahir),
                                      dataRow('Jenis Kelamin',
                                          pemohon.jenisKelamin),
                                      dataRow('Kewarganegaraan',
                                          pemohon.kewarganegaraan),
                                      dataRow('Agama', pemohon.agama),
                                      dataRow('Alamat', pemohon.alamat),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                (pemohon.kk == '' ||
                                        pemohon.jenisKelamin == '' ||
                                        pemohon.tempatLahir == '' ||
                                        pemohon.tanggalLahir == '' ||
                                        pemohon.agama == '' ||
                                        pemohon.kewarganegaraan == '' ||
                                        pemohon.alamat == '' ||
                                        pemohon.telpon == '' ||
                                        pemohon.pekerjaan == '')
                                    ? Text(
                                        'Lengkapi Data Pemohon Terlebih Dahulu',
                                        style: blackTextFont.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Column(
                                        children: [
                                          textForm('keperluan', 'Keperluan'),
                                          const SizedBox(height: 16),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      setState(
                                                        () => {
                                                          _keteranganCount++,
                                                        },
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty.all(
                                                                const EdgeInsets
                                                                    .all(2)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    primaryColor),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ))),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: const [
                                                          Icon(
                                                            MdiIcons.plusThick,
                                                            size: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          Text(
                                                            'KETERANGAN',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      setState(
                                                        () => {
                                                          (_keteranganCount ==
                                                                  1)
                                                              ? null
                                                              : _keteranganCount--,
                                                        },
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty.all(
                                                                const EdgeInsets
                                                                    .all(2)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    Colors.red),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ))),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: const [
                                                          Icon(
                                                            MdiIcons.minusThick,
                                                            size: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          Text(
                                                            'KETERANGAN',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          ListView.builder(
                                            itemCount: _keteranganCount,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (_, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Column(
                                                  children: [
                                                    textForm(
                                                        'keterangan${index + 1}',
                                                        "Keterangan ${index + 1}"),
                                                    const SizedBox(height: 16),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 16),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          secondaryColor),
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    isUploading = true;
                                                  });
                                                  _formBuilderKey.currentState!
                                                      .save();
                                                  if (_formBuilderKey
                                                      .currentState!
                                                      .validate()) {
                                                    _formBuilderKey
                                                        .currentState!.value
                                                        .forEach((key, value) {
                                                      var newKey =
                                                          key.substring(0, 9);
                                                      if (newKey ==
                                                          'keteranga') {
                                                        keterangan.add(value);
                                                      }
                                                    });
                                                    var data = {
                                                      'pemohonNik': pemohon.nik,
                                                      'keperluan':
                                                          _formBuilderKey
                                                                  .currentState!
                                                                  .value[
                                                              'keperluan'],
                                                      'keterangan': keterangan
                                                    };
                                                    var res = await API()
                                                        .uploadSurat(
                                                            data, 'sktm');
                                                    if (res.statusCode == 201) {
                                                      Fluttertoast.showToast(
                                                        backgroundColor:
                                                            Colors.teal[400],
                                                        msg:
                                                            'Sukses Kirim Surat',
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        textColor: Colors.white,
                                                        toastLength:
                                                            Toast.LENGTH_LONG,
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    } else {
                                                      Fluttertoast.showToast(
                                                        backgroundColor:
                                                            Colors.red,
                                                        msg:
                                                            'Gagal Kirim Surat',
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        textColor: Colors.white,
                                                        toastLength:
                                                            Toast.LENGTH_LONG,
                                                      );
                                                    }
                                                    setState(() {
                                                      isUploading = false;
                                                      keterangan = [];
                                                    });
                                                  } else {
                                                    setState(() {
                                                      isUploading = false;
                                                    });
                                                    Fluttertoast.showToast(
                                                      backgroundColor:
                                                          Colors.red,
                                                      msg:
                                                          'Lengkapi Form isian',
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      textColor: Colors.white,
                                                      toastLength:
                                                          Toast.LENGTH_LONG,
                                                    );
                                                  }
                                                },
                                                child: isUploading
                                                    ? const SpinKitRing(
                                                        color: Colors.white,
                                                        lineWidth: 3,
                                                        size: 25,
                                                      )
                                                    : const Text(
                                                        'KIRIM',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                              ],
                            ),
                          );
                        } else {
                          return const SpinKitRing(
                              color: primaryColor, size: 30, lineWidth: 6);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 10) * 0.6745,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(MdiIcons.arrowLeftBold, size: 36),
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

  Widget textForm(String name, String label) {
    return Container(
      width: MediaQuery.of(context).size.width - 24 * 2,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(-4, -4),
            color: Colors.white60,
          ),
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(4, 4),
            color: Color(0xFFA7A9AF),
          ),
        ],
        // border: Border.all(color: Colors.black.withOpacity(opacity), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FormBuilderTextField(
        name: name,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          // hintText: 'Keperluan',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        onChanged: (val) {
          _formBuilderKey.currentState!.validate();
        },
        validator:
            FormBuilderValidators.required(errorText: '$label harus diisi'),
      ),
    );
  }

  dataRow(String name, String value) {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
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
          padding: const EdgeInsets.all(8),
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
