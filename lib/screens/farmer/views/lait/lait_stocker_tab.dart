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

class LaitStockerTab extends StatelessWidget {
  const LaitStockerTab({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(top: 15.0),
                        height: _responsive.getHeight(.25),
                        width: _responsive.getWidth(.3),
                        child: LiquidLinearProgressIndicator(
                          value: 0.25, // Defaults to 0.5.
                          valueColor: const AlwaysStoppedAnimation(Colors
                              .pink), // Defaults to the current Theme's accentColor.
                          backgroundColor: Colors
                              .white, // Defaults to the current Theme's backgroundColor.
                          borderColor: Colors.red,
                          borderWidth: 5.0,
                          borderRadius: 12.0,
                          direction: Axis
                              .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                          center: Text("Tank $index"),
                        ),
                      );
                    }),
              ],
            ),
          );

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
