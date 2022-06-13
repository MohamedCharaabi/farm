import 'package:data_table_2/data_table_2.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/data/remote/vache_repository.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LaitGeterTab extends StatelessWidget {
  const LaitGeterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return FutureBuilder<List<CowModel>?>(
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

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DataTable2(
                columns: const [
                  DataColumn2(
                    label: Text('Date'),
                  ),
                  DataColumn2(
                    label: Text('Quantité'),
                  ),
                ],
                rows: [
                  for (final CowModel cow in _cows)
                    DataRow2(
                      cells: const [
                        DataCell(
                          Text('45/05/2020'),
                        ),
                        DataCell(
                          Text('155'),
                        ),
                      ],
                      onSelectChanged: (bool? selected) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CowDetailsScreen(cow: cow),
                        //   ),
                        // );
                      },
                    ),
                ],
              ));

          // return ListView.builder(
          //   itemCount: _cows.length,
          //   itemBuilder: (context, index) {
          //     final CowModel cow = _cows[index];
          //     return ListTile(
          //       title: Text(cow.name),
          //       subtitle: Text('${cow.owner_cin}'),
          //       trailing: const Icon(Icons.keyboard_arrow_right),
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) =>
          //                     CowDetailsScreen(selectedCow: cowsData[0])));
          //       },
          //     );
          //   },
          // );
        });
  }
}
