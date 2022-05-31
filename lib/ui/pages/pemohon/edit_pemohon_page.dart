part of '../pages.dart';

class EditPemohonPage extends StatefulWidget {
  EditPemohonPage({Key? key, required this.pemohon}) : super(key: key);

  var pemohon;

  @override
  State<EditPemohonPage> createState() => _EditPemohonPageState();
}

class _EditPemohonPageState extends State<EditPemohonPage> {
  List<String> jenisKelaminItem = ['Laki-laki', 'Perempuan'];

  var pemohonData;

  Map<String, dynamic> _data = {
    'nik': '',
    'nama': '',
    'jenis_kelamin': '',
    'jenis_kelamin': '',
    'tempat_lahir': '',
    'tanggal_lahir': '',
    'agama': '',
    'kewarganegaraan': '',
    'alamat': '',
    'telpon': '',
    'pekerjaan': '',
  };

  bool isUpdating = false;

  var _tanggalLahir;

  @override
  void initState() {
    super.initState();
    _valJenisKelamin = (widget.pemohon.jenisKelamin != '')
        ? widget.pemohon.jenisKelamin
        : _valJenisKelamin;
    _tanggalLahir = (widget.pemohon.tanggalLahir != '')
        ? widget.pemohon.tanggalLahir
        : _tanggalLahir;

    _data.update(
        'nik', (value) => (widget.pemohon.nik != '') ? widget.pemohon.nik : '');
    _data.update('nama',
        (value) => (widget.pemohon.nama != '') ? widget.pemohon.nama : '');
    _data.update(
        'jenis_kelamin',
        (value) => (widget.pemohon.jenisKelamin != '')
            ? widget.pemohon.jenisKelamin
            : _valJenisKelamin);
    _data.update(
        'tempat_lahir',
        (value) => (widget.pemohon.tempatLahir != '')
            ? widget.pemohon.tempatLahir
            : '');
    _data.update(
        'tanggal_lahir',
        (value) => (widget.pemohon.tanggalLahir != '')
            ? widget.pemohon.tanggalLahir
            : _tanggalLahir);
    _data.update('agama',
        (value) => (widget.pemohon.agama != '') ? widget.pemohon.agama : '');
    _data.update(
        'kewarganegaraan',
        (value) => (widget.pemohon.kewarganegaraan != '')
            ? widget.pemohon.kewarganegaraan
            : '');
    _data.update('alamat',
        (value) => (widget.pemohon.alamat != '') ? widget.pemohon.alamat : '');
    _data.update('telpon',
        (value) => (widget.pemohon.telpon != '') ? widget.pemohon.telpon : '');
    _data.update(
        'pekerjaan',
        (value) =>
            (widget.pemohon.pekerjaan != '') ? widget.pemohon.pekerjaan : '');
  }

  String _valJenisKelamin = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('EDIT PEMOHON'),
          backgroundColor: primaryColor,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        formGroup('NIK', _data['nik'], 'nik', readonly: true),
                        formGroup('Nama', _data['nama'], 'nama'),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text(
                                  'Jenis Kelamin',
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                child: Text(
                                  ':',
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(-4, -4),
                                        color: Colors.white,
                                      ),
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(4, 4),
                                        color: Color(0xFFA7A9AF),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: const Text('Pilih Jenis Kelamin'),
                                    value: _valJenisKelamin,
                                    items: jenisKelaminItem
                                        .map<DropdownMenuItem<String>>((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(e),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _valJenisKelamin = value!;
                                      });
                                      _data.update(
                                          'jenis_kelamin', (val) => value!);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        formGroup('Tempat Lahir', _data['tempat_lahir'],
                            'tempat_lahir'),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text(
                                  'Tanggal Lahir',
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                                child: Text(
                                  ':',
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(-4, -4),
                                        color: Colors.white,
                                      ),
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(4, 4),
                                        color: Color(0xFFA7A9AF),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1970),
                                              lastDate: DateTime.now())
                                          .then((value) {
                                        setState(() {
                                          _tanggalLahir =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(value!);
                                        });
                                      });
                                    },
                                    child: const Text(
                                      'Pilih',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(-4, -4),
                                        color: Colors.white,
                                      ),
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        offset: Offset(4, 4),
                                        color: Color(0xFFA7A9AF),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(_tanggalLahir ?? 'xxxx-xx-xx'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        formGroup('Agama', _data['agama'], 'agama'),
                        formGroup('Kewarganegaraan', _data['kewarganegaraan'],
                            'kewarganegaraan'),
                        formGroup('Alamat', _data['alamat'], 'alamat'),
                        formGroup('No. Handphone', _data['telpon'], 'telpon'),
                        formGroup('Pekerjaan', _data['pekerjaan'], 'pekerjaan'),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              elevation: MaterialStateProperty.all(4.0),
                            ),
                            onPressed: () async {
                              setState(() {
                                isUpdating = true;
                              });
                              var res = await API().updateUser(_data);
                              print(res);
                              if (res != 200) {
                                Flushbar(
                                  backgroundColor: Colors.red,
                                  duration: const Duration(milliseconds: 2500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                  icon: const Icon(MdiIcons.checkBold,
                                      color: Colors.white),
                                  message: 'Berhasil Edit Data',
                                  messageColor: Colors.white,
                                  title: 'SUKSES',
                                  titleColor: Colors.white,
                                ).show(context);
                                setState(() {
                                  isUpdating = false;
                                });
                                print(res);
                              } else {
                                Flushbar(
                                  backgroundColor: Colors.teal[400]!,
                                  duration: const Duration(milliseconds: 2500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                  icon: const Icon(MdiIcons.checkBold,
                                      color: Colors.white),
                                  message: 'Berhasil Edit Data',
                                  messageColor: Colors.white,
                                  title: 'SUKSES',
                                  titleColor: Colors.white,
                                ).show(context);
                                setState(() {
                                  isUpdating = false;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: isUpdating
                                  ? const SpinKitRing(
                                      color: Colors.white,
                                      lineWidth: 3,
                                      size: 25)
                                  : Text(
                                      'SIMPAN',
                                      style: whiteTextFont.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formGroup(String label, String? value, String name,
      {inputFormatter, bool obscure = false, bool readonly = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              label,
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
            child: Text(
              ':',
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: readonly ? Colors.grey[400] : backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10.0,
                    offset: Offset(-4, -4),
                    color: Colors.white,
                  ),
                  BoxShadow(
                    blurRadius: 10.0,
                    offset: Offset(4, 4),
                    color: Color(0xFFA7A9AF),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                cursorColor: secondaryColor,
                keyboardType: TextInputType.text,
                // controller: controller,
                inputFormatters:
                    (inputFormatter == null) ? null : [inputFormatter],
                obscureText: obscure,
                readOnly: readonly,
                onChanged: (val) {
                  _data.update(name, (value) => val);
                },
                initialValue: value ?? '',
                decoration: InputDecoration(
                  label: Text(label),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
