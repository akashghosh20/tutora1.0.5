import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:Tutora/pages/student/PDF/Hsc/ICT/IctDocument.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class IctReader extends StatefulWidget {
  IctReader(this.doc, {Key? key}) : super(key: key);
  IctDocument doc;

  @override
  State<IctReader> createState() => _IctReaderState();
}

class _IctReaderState extends State<IctReader> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doc.title!),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: SfPdfViewer.network(
        widget.doc.docUrl!,
        key: _pdfViewerKey,
      ),
    );
  }
}
