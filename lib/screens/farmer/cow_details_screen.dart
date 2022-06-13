import 'package:data_table_2/data_table_2.dart';
import 'package:farm_mobile/componnents/table_head.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
// import 'date_pickers_widgets/month_picker_page.dart';
// import 'date_pickers_widgets/months_picker_page.dart';

class CowDetailsScreen extends StatefulWidget {
  CowDetailsScreen({Key? key, required this.selectedCow}) : super(key: key);

  final Cow selectedCow;

  @override
  State<CowDetailsScreen> createState() => _CowDetailsScreenState();
}

class _CowDetailsScreenState extends State<CowDetailsScreen> {
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
    // print(widget.selectedCow.status == CowStatus.milky ? 'milky' : 'not milky');
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('${widget.selectedCow.name}(${widget.selectedCow.id})'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.edit),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            kSizedBox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.selectedCow.status == CowStatus.milky
                              ? primaryBlue
                              : goldenrod),
                      child: Center(
                        child: Text(
                          widget.selectedCow.status == CowStatus.milky
                              ? 'M'
                              : 'NM',
                          style: regular16pt.copyWith(color: white),
                        ),
                      ),
                    ),
                    Text(
                      '${widget.selectedCow.status == CowStatus.milky ? 'Milky' : 'Not Milky'}',
                      style: regular16pt,
                    ),
                  ],
                ),
                Text('${widget.selectedCow.age ?? '-'}', style: regular16pt),
              ],
            ),
            Text(
              '${widget.selectedCow.name}(${widget.selectedCow.id})',
              style: regular16pt.copyWith(fontWeight: FontWeight.bold),
            ),
            kSizedBox10,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Milk Total Production:',
                style: regular16pt.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(
                text: ' 150(L)',
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
                text: ' 300(KG)',
                style: regular16pt.copyWith(
                    background: Paint()..color = Colors.amber,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
            ])),
            kSizedBox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data',
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
                )
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
                            label: 'Date', activeSort: _selectedCol == 0)),
                  ),
                  DataColumn(
                    onSort: (i, b) {
                      setState(() {
                        _selectedCol = i;
                      });
                    },
                    label: Center(
                        child: TableHead(
                            label: 'Food', activeSort: _selectedCol == 1)),
                  ),
                  DataColumn(
                    onSort: (i, b) {
                      setState(() {
                        _selectedCol = i;
                      });
                    },
                    label:
                        TableHead(label: 'Milk', activeSort: _selectedCol == 2),
                  ),
                ],
                rows: animalProcessDataTable(
                    widget.selectedCow,
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

enum FilterDay {
  all,
  month,
  day,
}
