import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class SellPostResponses extends StatelessWidget {
  const SellPostResponses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Responses'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: _responsive.height,
        child: ListView.builder(itemBuilder: (context, index) {
          return ExpansionTile(
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/farmer_profile');
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Jamel Sassi',
                  style: regular16pt,
                )
              ],
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.place),
                Text('Cartage, Tunis'),
              ],
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: Text(
                  'Good morning sir, I see you that your selling 200L, I want to buy them can you provid me with firther infos..',
                  style: regular14pt,
                ),
              ),
              kSizedBox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Refuse",
                    style: heading5.copyWith(color: Colors.red),
                  ),
                  Text(
                    "Accept",
                    style: heading5.copyWith(color: Colors.green),
                  ),
                ],
              ),
              kSizedBox10,
            ],
          );
        }),
      ),
    );
  }
}
