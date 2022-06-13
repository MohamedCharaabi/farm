import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/table_head.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/data/remote/vache_repository.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:farm_mobile/screens/farmer/widgets/ajout_vache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AllAnimals extends StatefulWidget {
  AllAnimals({Key? key, this.status}) : super(key: key);

  CowStatus? status;

  @override
  _AllAnimalsState createState() => _AllAnimalsState();
}

class _AllAnimalsState extends State<AllAnimals> {
  int _selectedCol = 0;

  String _searchText = '';
  bool _floatingActionButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // print();
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: mainColor,
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search by id',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
            )
          ];
        },
        body: FutureBuilder<List<CowModel>?>(
            future: VacheRepository.getInstance().getCowsByCin('123456'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              }

              final List<CowModel> _cows = snapshot.data!;

              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  if (notification is UserScrollNotification) {
                    if (notification.direction == ScrollDirection.reverse) {
                      if (_floatingActionButtonVisible) {
                        setState(() {
                          _floatingActionButtonVisible = false;
                        });
                      }
                    } else if (notification.direction ==
                        ScrollDirection.forward) {
                      if (!_floatingActionButtonVisible) {
                        setState(() {
                          _floatingActionButtonVisible = true;
                        });
                      }
                    }
                  }
                  return true;
                },

                child: ListView.builder(
                  itemCount: _cows.length,
                  itemBuilder: (context, index) {
                    final CowModel cow = _cows[index];
                    return ListTile(
                      title: Text(cow.name),
                      subtitle: Text('${cow.owner_cin}'),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CowDetailsScreen(
                                    selectedCow: cowsData[0])));
                      },
                    );
                  },
                ),
                // child: SingleChildScrollView(
                //   child: Padding(
                //     padding: const EdgeInsets.all(0),
                //     child: SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: DataTable(
                //         dataRowHeight: 70,
                //         columns: [
                //           DataColumn(
                //             onSort: (i, b) {
                //               setState(() {
                //                 _selectedCol = i;
                //               });
                //             },
                //             label: Center(
                //                 child: TableHead(
                //                     label: 'Status',
                //                     activeSort: _selectedCol == 0)),
                //           ),
                //           DataColumn(
                //             onSort: (i, b) {
                //               setState(() {
                //                 _selectedCol = i;
                //               });
                //             },
                //             label: Center(
                //                 child: TableHead(
                //                     label: 'ID No',
                //                     activeSort: _selectedCol == 1)),
                //           ),
                //           DataColumn(
                //             onSort: (i, b) {
                //               setState(() {
                //                 _selectedCol = i;
                //               });
                //             },
                //             label: TableHead(
                //                 label: 'Name', activeSort: _selectedCol == 2),
                //           ),
                //           DataColumn(
                //             onSort: (i, b) {
                //               setState(() {
                //                 _selectedCol = i;
                //               });
                //             },
                //             label: TableHead(
                //                 label: 'Age', activeSort: _selectedCol == 3),
                //           ),
                //         ],
                //         rows:
                //             animalsData(arguments['arg'], _searchText, context),
                //       ),
                //     ),
                //   ),
                // ),
              );
            }),
      ),
      floatingActionButton: Visibility(
        visible: _floatingActionButtonVisible,
        child: FloatingActionButton(
          onPressed: () async {
            // modalsheet form

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const AjoutVache(),
            ).whenComplete(() => setState(() {}));
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
