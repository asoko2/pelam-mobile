part of '../pages.dart';

class PemohonPage extends StatefulWidget {
  const PemohonPage({Key? key}) : super(key: key);

  @override
  State<PemohonPage> createState() => _PemohonPageState();
}

class _PemohonPageState extends State<PemohonPage> {
  Pemohon? pemohonData;
  FilePickerResult? _fileKK;
  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 12),
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
                        'DATA PEMOHON',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  // color: Colors.blue,
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/edit-pemohon',
                            arguments: pemohonData);
                      },
                      child: const Text(
                        'EDIT',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, backgroundColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset.zero,
                        blurRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: FutureBuilder(
                    future: API().getPemohonData(user.id),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        var userData = snapshot.data;
                        Pemohon pemohon = Pemohon.fromJson(userData);
                        pemohonData = pemohon;
                        return BlocBuilder<PemohonBloc, PemohonState>(
                          builder: (context, pemohonState) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Table(
                                    border: TableBorder.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    columnWidths: const {
                                      0: FractionColumnWidth(0.37),
                                      1: FractionColumnWidth(0.03),
                                      2: FractionColumnWidth(0.6)
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      dataRow('NIK', pemohon.nik),
                                      dataRow('Nama', pemohon.nama),
                                      dataRow('Jenis Kelamin',
                                          pemohon.jenisKelamin),
                                      dataRow(
                                          'Tempat Lahir', pemohon.tempatLahir),
                                      dataRow('Tanggal Lahir',
                                          pemohon.tanggalLahir),
                                      dataRow('Agama', pemohon.agama),
                                      dataRow('Kewarganegaraan',
                                          pemohon.kewarganegaraan),
                                      dataRow('Alamat', pemohon.alamat),
                                      dataRow('No. Handphone', pemohon.telpon),
                                      dataRow('Pekerjaan', pemohon.pekerjaan),
                                      TableRow(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            child: Text(
                                              'KK',
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
                                            child: (pemohon.kk != '')
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              ImageDialog(
                                                                  pemohon
                                                                      .kkLink));
                                                    },
                                                    child:
                                                        const Text('Lihat KK'),
                                                  )
                                                : ElevatedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              UploadImageDialog(
                                                                  nik: pemohon
                                                                      .nik));
                                                    },
                                                    child:
                                                        const Text('Upload KK'),
                                                  ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: SpinKitRing(
                              color: Colors.white, lineWidth: 3, size: 20),
                        );
                      }
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        MdiIcons.home,
                        size: 60,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showImage(imageUrl) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
            context: context, builder: (_) => ImageDialog(imageUrl));
      },
    );
  }

  // Widget uploadImageDialog() {

  // }

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

class ImageDialog extends StatelessWidget {
  const ImageDialog(this.imageUrl, {Key? key}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class UploadImageDialog extends StatefulWidget {
  const UploadImageDialog({Key? key, required this.nik}) : super(key: key);

  final String nik;

  @override
  State<UploadImageDialog> createState() => _UploadImageDialogState();
}

class _UploadImageDialogState extends State<UploadImageDialog> {
  FilePickerResult? _fileKK;
  bool isUploading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? _file = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowMultiple: false,
                      allowedExtensions: ["JPG", "jpeg", "jpg", "png", "PNG"]);
                  setState(() {
                    _fileKK = _file;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                ),
                child: Text("Pilih File", style: whiteTextFont),
              ),
              Row(
                children: [
                  Text('File Name : ',
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.w600)),
                  Text(_fileKK?.files.single.name ?? 'Pilih file'),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (_fileKK == null)
                      ? null
                      : () async {
                          setState(() {
                            isUploading = true;
                          });
                          var res = await API()
                              .uploadKK(_fileKK!.files.single.path, widget.nik);

                          if (res == 200) {
                            setState(() {
                              isUploading = false;
                            });
                            Flushbar(
                              message: 'Berhasil Upload KK',
                              messageColor: Colors.white,
                              title: 'SUKSES',
                              titleColor: Colors.white,
                              backgroundColor: Colors.teal[400]!,
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              duration: const Duration(milliseconds: 2500),
                              icon: const Icon(
                                MdiIcons.checkBold,
                                color: Colors.white,
                              ),
                            ).show(context);
                          }
                        },
                  child: isUploading
                      ? const SpinKitRing(
                          color: Colors.white, lineWidth: 3, size: 25)
                      : const Text('UPLOAD'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
