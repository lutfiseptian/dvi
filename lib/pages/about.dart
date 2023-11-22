import 'package:digital_voucher_indonesia/pages/component/about.dart';
import 'package:digital_voucher_indonesia/pages/component/footer.dart';
import 'package:digital_voucher_indonesia/pages/component/header.dart';
import 'package:flutter/material.dart';
import 'package:digital_voucher_indonesia/pages/component/drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MyDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Header(
              onTap: () {
                _openDrawer();
              },
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(child: About()),
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
