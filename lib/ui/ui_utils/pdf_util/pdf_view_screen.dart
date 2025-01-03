import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({Key? key}) : super(key: key);

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  // PDFViewController? _pdfViewController;
  String remotePDFpath = "";
  bool loader = false;

  //var docFile;
  int? pages = 0;
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    String remotePDFpath = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)["remotePDFpath"] as String;
    //docFile = DefaultCacheManager().getSingleFile("https://firebasestorage.googleapis.com/v0/b/Siansa-5275d.appspot.com/o/files%2FDocument%20from%20Jyot%20Vavadiya?alt=media&token=e8da4c45-8050-4022-bc4d-32b6b6703634");
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: MyAppBar(
          title: "Resume",
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SfPdfViewer.network(remotePDFpath),
        ));
  }
}
