part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var nikMask = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool isSignUp = false;
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: backgroundColor,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'KARANGTINGGIL',
                  style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  MdiIcons.accountPlus,
                  size: 96,
                ),
                Text(
                  'DAFTAR AKUN',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                formGroup('Nama', namaController),
                formGroup('NIK', nikController, inputFormatter: nikMask),
                formGroup('Username', usernameController),
                formGroup('Password', passwordController, obscure: true),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isSignUp = true;
                    });
                    var data = {
                      'nama': namaController.text,
                      'nik': nikMask.getUnmaskedText(),
                      'username': usernameController.text,
                      'password': passwordController.text,
                    };
                    var res = await API().register(data);
                    if (res['token'] != null) {
                      Flushbar(
                        title: 'Sukses',
                        message: 'Berhasil Daftar Akun\nSilahkan Login',
                        messageColor: Colors.white,
                        backgroundColor: Colors.teal[400]!,
                        flushbarPosition: FlushbarPosition.TOP,
                        flushbarStyle: FlushbarStyle.FLOATING,
                        duration: const Duration(milliseconds: 2500),
                        icon: const Icon(
                          MdiIcons.checkBold,
                          color: Colors.white,
                        ),
                      ).show(context);
                      setState(() {
                        usernameController.text = '';
                        nikController.text = '';
                        namaController.text = '';
                        passwordController.text = '';
                      });
                    } else {
                      Flushbar(
                        message: 'Gagal Daftar',
                        messageColor: Colors.white,
                        backgroundColor: Colors.red,
                        flushbarPosition: FlushbarPosition.TOP,
                        flushbarStyle: FlushbarStyle.FLOATING,
                        duration: const Duration(milliseconds: 2500),
                        icon: const Icon(
                          MdiIcons.closeThick,
                          color: Colors.white,
                        ),
                      ).show(context);
                    }
                    setState(() {
                      isSignUp = false;
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(secondaryColor),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: isSignUp
                        ? const SpinKitRing(
                            color: Colors.white, lineWidth: 3, size: 20)
                        : const Text(
                            'DAFTAR',
                            style: TextStyle(fontSize: 20),
                          ),
                  ),
                ),
                const SizedBox(height: 48),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'KEMBALI',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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

  Widget formGroup(String label, TextEditingController controller,
      {inputFormatter, bool obscure = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            label,
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            ':',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 250,
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
              child: TextFormField(
                cursorColor: secondaryColor,
                keyboardType: TextInputType.text,
                controller: controller,
                inputFormatters:
                    (inputFormatter == null) ? null : [inputFormatter],
                obscureText: obscure,
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
