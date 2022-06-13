import 'package:farm_mobile/componnents/tab_farmer_post.dart';
import 'package:farm_mobile/componnents/tab_farmer_transport_history.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class TransportCallScreen extends StatefulWidget {
  const TransportCallScreen({Key? key}) : super(key: key);

  @override
  _TransportCallScreenState createState() => _TransportCallScreenState();
}

class _TransportCallScreenState extends State<TransportCallScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Transport'),
          centerTitle: true,
          backgroundColor: mainColor,
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            indicatorColor: white,
            tabs: const [
              Tab(
                text: 'Posts',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: _selectedIndex == 0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/call_transporter_form');
            },
            child: Icon(Icons.add),
            backgroundColor: mainColor,
          ),
        ),
        body: const TabBarView(
          children: [
            TabFarmerPost(),
            TabFarmerTransportHistory(),
          ],
        ),
      ),
    );
  }
}
