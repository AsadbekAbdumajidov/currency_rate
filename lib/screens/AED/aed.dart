import 'package:dollar_cursi/data/data.dart';
import 'package:dollar_cursi/models/model.dart';
import 'package:dollar_cursi/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aed extends StatefulWidget {
  const Aed({Key? key}) : super(key: key);

  @override
  _AedState createState() => _AedState();
}

class _AedState extends State<Aed> {
  String _seleckt = 'AED';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.14,
      height: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: Border.all(width: 1, color: Colors.black38)),
      child: FutureBuilder(
        future: KursServis.dollar(),
        builder: (context, AsyncSnapshot<List<Kurs>> snap) {
          if (!snap.hasData) {
            return const CupertinoActivityIndicator();
          } else if (snap.hasError) {
            return const Center(
              child: Text('Xato bor'),
            );
          } else {
            return PopupMenuButton(
              onSelected: (v) {
                _seleckt = v.toString();

                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(_seleckt), const Icon(Icons.arrow_drop_down)],
                ),
              ),
              itemBuilder: (context) {
                return List.generate(snap.data!.length, (index) {
                  return PopupMenuItem(
                    onTap: () {
                      _seleckt = snap.data![Data.intqil = index].code!;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              flags[index]['flagss'].toString(),
                            ),
                          ),
                          Text(snap.data![index].code.toString()),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          }
        },
      ),
    );
  }
}
