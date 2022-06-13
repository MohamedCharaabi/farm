import 'package:farm_mobile/componnents/one_character.dart';
import 'package:flutter/material.dart';

class ShopHistory extends StatelessWidget {
  const ShopHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// shop history
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        OneCharacter(character: 'A'),
                        const Text('Karim Saiid'),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.place),
                        Text('Sidi Median, Zaghouan'),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {});
          }),
    );
  }
}
