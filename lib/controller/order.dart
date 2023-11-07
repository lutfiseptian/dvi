import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = [
    {
      "name": "Mobile Legend",
      'qty': "1",
      "amount": "Rp.100.000",
      "subtotal": "Rp.100.0000"
    },
    {
      "name": "Bizzard Gift",
      'qty': "1",
      "amount": "Rp.100.000",
      "subtotal": "Rp.100.0000"
    }
  ].obs;

  var virtualAccounts = [
    {
      "name": "Virtual Account BCA",
      "icon": "assets/images/bca_logo.png",
      "is_selected": 1
    },
    {
      "name": "Virtual Account Dana",
      "icon": "assets/images/dana_logo.png",
      "is_selected": 1
    },
  ].obs;
  var paymentSteps = [
    {
      "name": "Step 1",
    },
    {
      "name": "Step 2",
    },
    {
      "name": "Step 3",
    },
  ].obs;
}
