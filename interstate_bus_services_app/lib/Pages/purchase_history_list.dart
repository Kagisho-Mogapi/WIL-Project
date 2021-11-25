import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:interstate_bus_services_app/widgets/message_card.dart';
import 'package:interstate_bus_services_app/widgets/purchase_card.dart';

class PurchaseHistoryList extends StatefulWidget {
  const PurchaseHistoryList({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryListState createState() => _PurchaseHistoryListState();
}

class _PurchaseHistoryListState extends State<PurchaseHistoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background2.jpg'),
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Purchase',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'History List',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Purchases',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 0.0,
                  ),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return PurchaseCard(
                          messageToggleAction: (value) async {},
                          deletaAction: () async {},
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
