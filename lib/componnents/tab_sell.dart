import 'package:farm_mobile/componnents/one_character.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class TabSell extends StatefulWidget {
  const TabSell({Key? key}) : super(key: key);

  @override
  State<TabSell> createState() => _TabSellState();
}

class _TabSellState extends State<TabSell> {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: false,
        itemCount: 6,
        itemBuilder: (_, index) {
          return SizedBox(
            height: _responsive.getHeight(0.2),
            width: _responsive.width,
            child: Card(
              child: Row(
                children: <Widget>[
                  // image
                  Container(
                    width: _responsive.getWidth(0.3),
                    padding: const EdgeInsets.all(3.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        centerSlice: Rect.largest,
                        image: AssetImage(
                          'assets/images/apples.jpg',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // name + quantity col
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('Apple', style: heading16),
                                  OneCharacter(
                                    character: '6',
                                    backgroundColor: Colors.red,
                                    padding: 5.0,
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry>[
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
                                            context, '/sell_post_responses');
                                      },
                                      leading: const Icon(Icons.dvr),
                                      title: const Text('See Responses'),
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
                            ],
                          ),
                          const Text('Your price: 19dt'),
                          const Text(
                            'bla bla bla  bla nla bla bla bla  bla nlabla bla bla  bla nlabla bla bla  bla nlabla bla bla  bla nlabla bla bla  bla nla',
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
