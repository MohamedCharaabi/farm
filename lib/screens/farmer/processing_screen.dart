import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:farm_mobile/componnents/table_head.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ProcessScreen extends StatefulWidget {
  ProcessScreen({Key? key}) : super(key: key);

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");

  FilterDay _filterDay = FilterDay.all;

  DateTime _selectedDate = DateTime.now();

  int _selectedCol = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Processing'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.pushNamed(context, '/daily_process');
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            kSizedBox10,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Milk Total Production:',
                style: regular16pt.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(
                text: ' 500(L)',
                style: regular16pt.copyWith(
                    background: Paint()..color = Colors.amber,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
            ])),
            kSizedBox10,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Food Total Consummed:',
                style: regular16pt.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(
                text: ' 1500(KG)',
                style: regular16pt.copyWith(
                    background: Paint()..color = Colors.amber,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
            ])),

            // week process
            kSizedBox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily Process',
                  style: heading5.copyWith(color: textBlack),
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _filterDay = FilterDay.all;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: _filterDay == FilterDay.all
                              ? primaryBlue
                              : backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: _filterDay == FilterDay.all
                                  ? white
                                  : primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _filterDay = FilterDay.month;
                        });

                        showMonthPicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 1, 5),
                          lastDate: DateTime(DateTime.now().year + 1, 9),
                          initialDate: _selectedDate,
                          locale: Locale("en"),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              _selectedDate = date;
                            });
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: _filterDay == FilterDay.month
                              ? primaryBlue
                              : backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            'Month',
                            style: TextStyle(
                              color: _filterDay == FilterDay.month
                                  ? white
                                  : primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _filterDay = FilterDay.day;
                        });

                        _selectDate(context);
                        // showDatePicker(
                        //   context: context,
                        //   firstDate: DateTime(DateTime.now().year - 1, 5),
                        //   lastDate: DateTime(DateTime.now().year + 1, 9),
                        //   initialDate: _selectedDate,
                        // );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: _filterDay == FilterDay.day
                              ? primaryBlue
                              : backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            'day',
                            style: TextStyle(
                              color: _filterDay == FilterDay.day
                                  ? white
                                  : primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            kSizedBox10,
            Expanded(
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                dataRowHeight: 70,
                columns: [
                  DataColumn(
                    onSort: (i, b) {
                      setState(() {
                        _selectedCol = i;
                      });
                    },
                    label: Center(
                        child: TableHead(
                            label: 'Cow', activeSort: _selectedCol == 0)),
                  ),
                  DataColumn(
                    onSort: (i, b) {
                      setState(() {
                        _selectedCol = i;
                      });
                    },
                    label: Center(
                        child: TableHead(
                            label: 'Date', activeSort: _selectedCol == 1)),
                  ),
                  DataColumn(
                    onSort: (i, b) {
                      setState(() {
                        _selectedCol = i;
                      });
                    },
                    label: Center(
                        child: TableHead(
                            label: 'Food', activeSort: _selectedCol == 2)),
                  ),
                  DataColumn(
                    onSort: (i, b) {
                      setState(() {
                        _selectedCol = i;
                      });
                    },
                    label:
                        TableHead(label: 'Milk', activeSort: _selectedCol == 3),
                  ),
                ],
                rows: animalProcessDataTable(
                    null,
                    _filterDay == FilterDay.all ? null : _selectedDate,
                    _filterDay,
                    context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
