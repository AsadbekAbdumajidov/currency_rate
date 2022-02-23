import 'package:dollar_cursi/data/data.dart';
import 'package:flutter/material.dart';

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  _ResState createState() => _ResState();
}

class _ResState extends State<Res> {
  @override
  Widget build(BuildContext context) {
    return
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.048,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(width: 1, color: Colors.blueGrey.shade400),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: Data.control,
              ),
            ),
          
      
    );
  }
}
