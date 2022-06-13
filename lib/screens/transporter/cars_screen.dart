import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Cars'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Container(
        height: _responsive.height,
        padding: const EdgeInsets.only(top: 8.0, right: 15.0, left: 15.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Car 00$index'),
                  subtitle: Text('79135$index'),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/transporter_car_history');
                          },
                          leading: const Icon(Icons.dvr),
                          title: const Text('See History'),
                        ),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
