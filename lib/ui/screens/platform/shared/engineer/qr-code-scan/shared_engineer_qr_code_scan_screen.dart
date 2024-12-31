import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/ui/screens/platform/shared/engineer/qr-code-scan/equipment%D9%80%D9%80_detail_screen.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class SharedEngineerQrCodeScanScreen extends StatefulWidget {
  const SharedEngineerQrCodeScanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SharedEngineerQrCodeScanScreenState();
}

class _SharedEngineerQrCodeScanScreenState
    extends State<SharedEngineerQrCodeScanScreen> {
  // Barcode? result;
  // QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isLoading = true;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   }
  //   controller!.resumeCamera();
  // }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  getPremission() async {
    PermissionStatus status = await _getCameraPermission();
  }

  @override
  void initState() {
    // TODO: implement initState
    getPremission().then((val) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Result? currentResult;
  final QRCodeDartScanController _controller = QRCodeDartScanController();
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Text("Loading!"),
          ),
        ),
      );
    }
    return Scaffold(
        body: Column(
      children: [
        Expanded(flex: 4, child: _buildQRView()),
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (currentResult != null)
                  SizedBox(
                    height: 50,
                    child: Text(
                        'Barcode Type: ${currentResult!.runtimeType}   Data: ${currentResult!.text}'),
                  )
                else
                  SizedBox(
                    height: 50,
                    child: const Text(
                      'Scan a code',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  QRCodeDartScanView _buildQRView() {
    return QRCodeDartScanView(
      controller: _controller,
      scanInvertedQRCode: true,
      onCapture: (Result result) {
        setState(() {
          currentResult = result;
        });
        context.go(RoutesConstants.EQUIPMENT_DETAIL_SCREEN);
      },
    );
  }
}
