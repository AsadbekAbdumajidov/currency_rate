import 'dart:io';
import 'package:dollar_cursi/data/data.dart';
import 'package:dollar_cursi/models/model.dart';
import 'package:dollar_cursi/screens/AED/aed.dart';
import 'package:dollar_cursi/screens/about/about.dart';
import 'package:dollar_cursi/screens/builder/builder.dart';
import 'package:dollar_cursi/screens/response/response.dart';
import 'package:dollar_cursi/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DollarCursim extends StatefulWidget {
  const DollarCursim({Key? key}) : super(key: key);

  @override
  _DollarCursimState createState() => _DollarCursimState();
}

class _DollarCursimState extends State<DollarCursim>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List listuser = [];

  @override
  void initState() {
    super.initState();
    KursServis.dollar().then((value) {
      listuser = value;
      _tabController = TabController(length: 3, vsync: this);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: tapBar(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Aed(),
                    request(context),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Res(),
                      InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.048,
                          decoration:
                              BoxDecoration(color: Colors.blue.shade900),
                          child: const Center(
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Builderim(),
        ],
      ),
    );
  }

  Container request(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.048,
      width: MediaQuery.of(context).size.width * 0.52,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(width: 1, color: Colors.blueGrey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: KursServis.dollar(),
              builder: (context, AsyncSnapshot<List<Kurs>> snap) {
                if (!snap.hasData) {
                  return const CupertinoActivityIndicator();
                } else if (snap.hasError) {
                  return const Center(
                    child: Text('Xato bor'),
                  );
                } else {
                  double b = double.parse(snap.data![Data.intqil].cbPrice!);
                  double c = double.parse(Data.control.text);
                  return Center(
                    child: Text(
                      Data.control.text.isEmpty
                          ? "${c = 0}"
                          : (c * b).toStringAsFixed(2).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  );
                }
              },
            ),
            const Text(
              'UZS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Container tapBar() {
    return Container(
      color: Colors.blue.shade900,
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.red.shade800,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white38,
        onTap: (value) {
          setState(() {});
        },
        tabs: const [
          Tab(
            text: "Currency converter",
          ),
          Tab(
            text: "Currency Exchange",
          ),
          Tab(
            text: "Currency History",
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.blue.shade900,
      title: const Text("Currensy Converter"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
            icon: const Icon(Icons.help_sharp, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
