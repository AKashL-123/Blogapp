import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({Key? key}) : super(key: key);

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  @override
  bool isChecked = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Approval")),
        body: Column(
          children: [
            Center(
              child: CheckboxListTile(
                title: Text("Accept"),
                value: isChecked,
                onChanged: (newValue) {
                  setState(() {
                    isChecked = true;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
            CheckboxListTile(
              title: Text("Deny"),
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = true;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Pending"),
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = true;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            Padding(
              padding: const EdgeInsets.all(68.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Qr()));
                  },
                  child: Text(
                    "QRCODE",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class Qr extends StatefulWidget {
  const Qr({Key? key}) : super(key: key);

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/qr.png")),
    );
  }
}
