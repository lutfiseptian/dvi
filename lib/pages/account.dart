import 'package:digital_voucher_indonesia/pages/component/footer.dart';
import 'package:digital_voucher_indonesia/pages/component/header.dart';
import 'package:digital_voucher_indonesia/pages/component/account.dart';
import 'package:flutter/material.dart';
import 'package:digital_voucher_indonesia/pages/component/drawer.dart';
class AccountPag extends StatefulWidget {
  const AccountPag({super.key});

  @override
  State<AccountPag> createState() => _AccountPagState();
}

class _AccountPagState extends State<AccountPag> {
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
                child: SingleChildScrollView(child: Acccount()),
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
