import 'package:flutter/material.dart';
import 'package:pelam/ui/pages/pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/sign-up':
        return myPageBuilder(const SignUpPage());
      case '/pemohon':
        return myPageBuilder(const PemohonPage());
      case '/pelayanan-surat':
        return myPageBuilder(const PelayananSuratPage());
      case '/permohonan-surat':
        return myPageBuilder(PermohonanSuratPage(nik: args.toString()));
      case '/prosedur':
        return myPageBuilder(const ProsedurPage());
      case '/jadwal-pelayanan':
        return myPageBuilder(const JadwalPelayananPage());
      case '/sktm':
        return myPageBuilder(const SktmPage());
      case '/skck':
        return myPageBuilder(const SkckPage());
      case '/domisili':
        return myPageBuilder(const DomisiliPage());
      case '/sku':
        return myPageBuilder(const SkuPage());
      case '/surat-keterangan':
        return myPageBuilder(const SuratKeteranganPage());
      case '/kehilangan-kk':
        return myPageBuilder(const KehilanganKkPage());
      case '/edit-pemohon':
        return myPageBuilder(EditPemohonPage(pemohon: args));
      default:
        return MaterialPageRoute(builder: (_) => const SignInPage());
    }
  }
}

myPageBuilder(Widget newRoute) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => newRoute,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
