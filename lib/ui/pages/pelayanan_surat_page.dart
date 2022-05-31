part of 'pages.dart';

class PelayananSuratPage extends StatelessWidget {
  const PelayananSuratPage({Key? key}) : super(key: key);

  static const InteractiveInkFeatureFactory _rippleFactory =
      InkRipple.splashFactory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 2,
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
                        MdiIcons.email,
                        size: 70,
                      ),
                      const Text(
                        'PELAYANAN SURAT',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                  child: Center(
                    child: GridView.count(
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      crossAxisCount: 2,
                      children: [
                        tileButton(context, 'sktm', 'email', 'SKTM'),
                        tileButton(context, 'skck', 'email', 'SKCK'),
                        tileButton(
                            context, 'domisili', 'email', 'Surat Domisili'),
                        tileButton(context, 'sku', 'email', 'SKU'),
                        tileButton(context, 'surat-keterangan', 'email',
                            'SURAT KETERANGAN'),
                        tileButton(context, 'kehilangan-kk', 'email',
                            'SURAT KEHILANGAN KK'),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tileButton(
      BuildContext context, String menu_url, String icon, String text) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(8),
      elevation: 10,
      child: InkWell(
        splashColor: Colors.white30,
        splashFactory: _rippleFactory,
        onTap: () {
          Navigator.pushNamed(context, '/$menu_url');
        },
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.fromString(icon),
                  size: 72,
                  color: backgroundColor,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
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
    );
  }
}
