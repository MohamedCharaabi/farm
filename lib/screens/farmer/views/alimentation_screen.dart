import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/table_head.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/data/remote/vache_repository.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlimentationScreen extends StatefulWidget {
  AlimentationScreen({Key? key, this.status}) : super(key: key);

  CowStatus? status;

  @override
  _AlimentationScreenState createState() => _AlimentationScreenState();
}

class _AlimentationScreenState extends State<AlimentationScreen> {
  int _selectedCol = 0;

  String _searchText = '';
  bool _milkingInput = false;
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
              );
            }),
      ),
      floatingActionButton: Visibility(
        visible: _floatingActionButtonVisible,
        child: FloatingActionButton(
          onPressed: () {
            // modalsheet form

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => addLaitForm(context),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  SingleChildScrollView addLaitForm(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ajout Lait',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ID Vache',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Quantité',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ph',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'matiere_grasse',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Densite',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomPrimaryButton(
                    buttonColor: mainColor,
                    textValue: 'Submit',
                    textColor: white,
                    onClick: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
