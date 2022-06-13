// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/data/remote/lait_repository.dart';
import 'package:farm_mobile/data/remote/vache_repository.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/domain/models/ap/lait_model.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class AllLaitTab extends StatefulWidget {
  AllLaitTab({Key? key}) : super(key: key);

  @override
  State<AllLaitTab> createState() => _AllLaitTabState();
}

class _AllLaitTabState extends State<AllLaitTab> {
  List<int> _selected = [];
  int? _selctedTank;

  @override
  Widget build(BuildContext context) {
    final LaitRepository _laitRepo = LaitRepository.getInstance();
    Responsive _responsive = Responsive(context);
    return FutureBuilder<List<LaitModel>?>(
        future: LaitRepository.getInstance().getAllLait('123456'),
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

          final List<LaitModel> _lait = snapshot.data!;

          return ListView.builder(
            itemCount: _lait.length,
            itemBuilder: (context, index) {
              final LaitModel lait = _lait[index];

              return Column(
                key: ValueKey(lait.id),
                children: [
                  Slidable(
                    // key: ValueKey(lait.id),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          autoClose: false,
                          onPressed: (context) async {
                            // final tankId = await
                            final bool _isSelected =
                                _selected.contains(lait.id);
                            if (_isSelected) {
                              setState(() {
                                _selected.remove(lait.id);
                              });
                            } else {
                              setState(() {
                                _selected.add(lait.id);
                              });
                            }
                          },
                          backgroundColor: mainColor,
                          foregroundColor: Colors.white,
                          icon: Icons.propane_tank,
                          // label: 'Stocker',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.sell,
                          // label: 'Vender',
                          spacing: 10.0,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          // label: 'Geter',
                        ),
                      ],
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: goldenrod.withOpacity(.8),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                        minVerticalPadding: 15.0,
                        title: Text('VacheID: ${lait.idVache}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('PH: ${lait.ph}   '),
                                Text('DENSITE: ${lait.densite}'),
                              ],
                            ),
                            Text('MATIERE GR: ${lait.matierGrasse}'),
                            Text('${lait.date}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    key: ValueKey(lait.id),
                    // color: Colors.red,
                    height: _selected.contains(lait.id)
                        ? _responsive.getHeight(.15)
                        : 0,
                    width: _responsive.width,
                    child: Column(
                      children: [
                        const Text("Selcectione tank:"),
                        Wrap(
                          spacing: 15,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selctedTank = 1;
                                });
                              },
                              child: Chip(
                                backgroundColor:
                                    _selctedTank == 1 ? mainColor : null,
                                label: const Text("Tank1"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selctedTank = 2;
                                });
                              },
                              child: Chip(
                                backgroundColor:
                                    _selctedTank == 2 ? mainColor : null,
                                label: const Text("Tank2"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selctedTank = 3;
                                });
                              },
                              child: Chip(
                                backgroundColor:
                                    _selctedTank == 3 ? mainColor : null,
                                label: const Text("Tank3"),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          onPressed: () async {
                            if (_selctedTank == null) {
                              Fluttertoast.showToast(
                                  msg: "Selectioner une tank!!");
                              return;
                            }
                            final Map<String, dynamic> _data = {
                              'id_lait': lait.id,
                              'qte': lait.quantity,
                              'id_tank': _selctedTank,
                            };
                            log('data $_data');

                            await _laitRepo.ajoutLaitStocker(_data);
                          },
                          child: const Text("Submit"),
                          color: mainColor,
                          disabledColor: mainColor,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        });
  }
}
