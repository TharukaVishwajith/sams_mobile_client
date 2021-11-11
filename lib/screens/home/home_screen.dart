import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sams/model/student_model.dart';
import 'package:sams/screens/home/components/app_drawer.dart';
import 'package:sams/service/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sams/util/image_util.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isDetailsDialogOpened = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     // _counter++;
  //   });
  // }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData != null) {
        isDetailsDialogOpened = true;
        controller.pauseCamera();
      }
      setState(() {
        result = scanData;
      });
      APIService().getStudent('SE-2013-038').then((value) {
        print(value.studentNo + '--------' + value.nicNo);
        _studentDetailDialog(context, value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && !this.isDetailsDialogOpened) {
      controller!.resumeCamera();
      print('==========' +
          isDetailsDialogOpened.toString() +
          '====================');
      print(
          '==================================resumeCamera=============================');
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      : Text('Scan a code'),
                ),
              )
            ],
          ),
        ),
        drawer: Container(width: 230, child: AppDrawer()));
  }

  _studentDetailDialog(context, StudentResponse student) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text(student.studentNo, textAlign: TextAlign.center),
            content: Container(
              // child: Image.asset('assets/images/login_bottom.png'),
              // child: new ImageUtil().imageFromBase64String(student.imageDataBase64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // ImageUtil().imageFromBase64String(student.imageDataBase64),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.green,
                      width: 5,
                    )),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ImageUtil()
                          .imageFromBase64String(student.imageDataBase64),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        student.firstName + ' ' + student.lastName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 30),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        student.studentNo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'LEVEL ' + student.year.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'FACULTY OF ' + student.faculty.toTitleCase,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      color: Colors.green,
                      elevation: 5.0,
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await controller!.resumeCamera();
                        isDetailsDialogOpened = false;
                        Navigator.pop(context, false);
                        Fluttertoast.showToast(
                            msg: "Camera resumed!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                    ),
                  )),
            ],
          );
        });
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  String get toTitleCase => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.toCapitalized())
      .join(" ");
}
