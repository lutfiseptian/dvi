import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/pages/component/about.dart';
import 'package:digital_voucher_indonesia/pages/component/dashboard.dart';
import 'package:digital_voucher_indonesia/pages/component/footer.dart';
import 'package:digital_voucher_indonesia/pages/component/header.dart';
import 'package:digital_voucher_indonesia/pages/component/account.dart';
import 'package:digital_voucher_indonesia/pages/component/drawer.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Header(
                onTap: () {
                  _openDrawer();
                },
              ),
            ),
            // Expanded(
            //   child: Container(
            //     height: double.maxFinite,
            //     width: MediaQuery.of(context).size.width,
            //     child: SingleChildScrollView(child: Dashboard()),
            //   ),
            // ),
            // InkWell(child: Footer())
          ],
        ),
      ),
    );
  }
}
