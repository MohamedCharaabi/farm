import 'package:farm_mobile/componnents/transporter/current_transports.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../componnents/transporter/history_transports.dart';

class TransportsScreen extends StatelessWidget {
  const TransportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Transports'),
          centerTitle: true,
          backgroundColor: mainColor,
          bottom: TabBar(
            indicatorColor: white,
            tabs: const [
              Tab(text: 'Current'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CurrentTransports(),
            HistoryTransports(),
          ],
        ),
      ),
    );
  }
}
