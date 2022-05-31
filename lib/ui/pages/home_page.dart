part of 'pages.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);
  static const InteractiveInkFeatureFactory _rippleFactory =
      InkRipple.splashFactory;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showLoginFlushbar(context));
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  child: const Text(
                    'KARANGTINGGIL',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor,
                      shadows: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6, -6),
                          blurRadius: 30,
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(6, 6),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 12),
                    child: Center(
                      child: GridView.count(
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        crossAxisCount: 2,
                        children: [
                          tileButton(
                              context, 'pemohon', 'account', 'DATA PEMOHON'),
                          tileButton(context, 'pelayanan-surat', 'email',
                              'PELAYANAN SURAT'),
                          tileButton(context, 'permohonan-surat', 'viewList',
                              'PERMOHONAN SURAT'),
                          tileButton(context, 'prosedur', 'informationOutline',
                              'PROSEDUR'),
                          tileButton(context, 'jadwal-pelayanan',
                              'calendarBlank', 'JADWAL PELAYANAN'),
                          Material(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            elevation: 10,
                            child: InkWell(
                              splashColor: Colors.white30,
                              splashFactory: _rippleFactory,
                              onTap: () {
                                context
                                    .read<AuthenticationBloc>()
                                    .add(AuthenticationLogoutRequested());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      MdiIcons.fromString('logoutVariant'),
                                      size: 96,
                                      color: backgroundColor,
                                    ),
                                    const Text(
                                      'KELUAR',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: backgroundColor,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  showLoginFlushbar(context) {
    Flushbar(
      message: 'Berhasil Login',
      messageColor: Colors.white,
      title: 'Sukses',
      titleColor: Colors.white,
      backgroundColor: Colors.teal[400]!,
      duration: const Duration(milliseconds: 1500),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: const Icon(MdiIcons.checkCircle, color: Colors.white),
      showProgressIndicator: true,
      shouldIconPulse: true,
    ).show(context);
  }

  Widget tileButton(
      BuildContext context, String menuUrl, String icon, String text) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(8),
      elevation: 10,
      child: InkWell(
        splashColor: Colors.white30,
        splashFactory: _rippleFactory,
        onTap: () {
          Navigator.pushNamed(context, '/$menuUrl');
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.fromString(icon),
                size: 96,
                color: backgroundColor,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: backgroundColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              )
            ],
          ),
        ),
      ),
    );
  }
}
