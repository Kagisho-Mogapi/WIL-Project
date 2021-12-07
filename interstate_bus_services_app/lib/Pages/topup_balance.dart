import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

class TopupBalance extends StatefulWidget {
  const TopupBalance({Key? key}) : super(key: key);

  @override
  _TopupBalanceState createState() => _TopupBalanceState();
}

class _TopupBalanceState extends State<TopupBalance> {
  TextEditingController amountController = TextEditingController();
  int currentBalance = 0;

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.85,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.red, Colors.blue]),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/PurchaseDetail.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 44,
                        ),
                        Text(
                          'Topup Balance',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                        Text(
                          'R${context.read<UserService>().currentUser!.getProperty('credits')}',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        hintText: 'Enter Amount',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[400],
                        fixedSize: Size(300, 60),
                      ),
                      onPressed: () {
                        double amountInt =
                            double.parse(amountController.text.trim());
                        double creditsInt = double.parse(context
                            .read<UserService>()
                            .currentUser!
                            .getProperty('credits'));

                        UserService.topUpAmount = amountInt + creditsInt;

                        Navigator.pushNamed(
                            context, RouteManager.paymentDetails);
                      },
                      child: Text('Topup'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
