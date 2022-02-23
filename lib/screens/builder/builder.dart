import 'package:dollar_cursi/data/data.dart';
import 'package:dollar_cursi/models/model.dart';
import 'package:dollar_cursi/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Builderim extends StatefulWidget {
  const Builderim({Key? key}) : super(key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<Builderim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.704,
      width: double.infinity,
      color: Colors.transparent,
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
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue.shade50,
                  child: ListTile(
                    onTap: () {},
                    trailing: Text('${snap.data![index].cbPrice}  UZS'),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        flags[index]['flagss'].toString(),
                      ),
                    ),
                    title: Text(
                      '1 ${snap.data![index].title}, ${snap.data![index].code} => ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                );
              },
              itemCount: snap.data!.length,
            );
          }
        },
      ),
    );
  }
}
