import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/table_head.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/data/remote/vache_repository.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:farm_mobile/screens/farmer/views/lait/all_lait_tab.dart';
import 'package:farm_mobile/screens/farmer/views/lait/lait_geter_tab.dart';
import 'package:farm_mobile/screens/farmer/views/lait/lait_stocker_tab.dart';
import 'package:farm_mobile/screens/farmer/views/lait/lait_vendu_tab.dart';
import 'package:farm_mobile/screens/farmer/widgets/ajout_lait.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LaitScreen extends StatefulWidget {
  LaitScreen({Key? key, this.status}) : super(key: key);

  CowStatus? status;

  @override
  _LaitScreenState createState() => _LaitScreenState();
}

class _LaitScreenState extends State<LaitScreen> {
  int _selectedCol = 0;

  String _searchText = '';
  bool _milkingInput = false;
  bool _floatingActionButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // print();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: mainColor,
                  title: const Text("Lait"),
                  centerTitle: true,
                  bottom: const TabBar(
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    tabs: [
                      // Text("Lait"),
                      Text("Stocker"),
                      Text("Vendue"),
                      Text("Geter"),
                    ],
                  ),
                )
              ];
            },
            body: const TabBarView(children: [
              // AllLaitTab(),
              LaitStockerTab(),
              LaitVenduTab(),
              LaitGeterTab(),
            ])),
        floatingActionButton: Visibility(
          visible: _floatingActionButtonVisible,
          child: FloatingActionButton(
            onPressed: () {
              // modalsheet form

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const AjoutLait(),
              );
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
