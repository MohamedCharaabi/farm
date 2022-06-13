import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/data/remote/lait_repository.dart';
import 'package:farm_mobile/screens/farmer/views/farmer_dashoboard.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AjoutLait extends StatefulWidget {
  const AjoutLait({Key? key}) : super(key: key);

  @override
  State<AjoutLait> createState() => _AjoutLaitState();
}

class _AjoutLaitState extends State<AjoutLait> {
  bool _btnLoading = false;

  final TextEditingController _vacheIdController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _mGrasseController = TextEditingController();
  final TextEditingController _densiteController = TextEditingController();

  int _selectedLaitState = 0;
  void changeLaitState(int index) {
    setState(() {
      _selectedLaitState = index;
    });
  }

  int? _selectedTank;

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
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
                  controller: _vacheIdController,
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
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    labelText: 'Quantité',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _phController,
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
                  controller: _mGrasseController,
                  decoration: const InputDecoration(
                    labelText: 'matiere_grasse',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _densiteController,
                  decoration: const InputDecoration(
                    labelText: 'Densite',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedBtn(
                    title: "Srocker",
                    onPressed: () => changeLaitState(0),
                    isSelected: _selectedLaitState == 0,
                  ),
                  RoundedBtn(
                    title: "Vender",
                    onPressed: () => changeLaitState(1),
                    isSelected: _selectedLaitState == 1,
                  ),
                  RoundedBtn(
                    title: "Jeter",
                    onPressed: () => changeLaitState(2),
                    isSelected: _selectedLaitState == 2,
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                // color: Colors.red,
                height:
                    _selectedLaitState == 0 ? _responsive.getHeight(.15) : 0,
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
                              _selectedTank = 1;
                            });
                          },
                          child: Chip(
                            backgroundColor:
                                _selectedTank == 1 ? mainColor : null,
                            label: const Text("Tank1"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTank = 2;
                            });
                          },
                          child: Chip(
                            backgroundColor:
                                _selectedTank == 2 ? mainColor : null,
                            label: const Text("Tank2"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTank = 3;
                            });
                          },
                          child: Chip(
                            backgroundColor:
                                _selectedTank == 3 ? mainColor : null,
                            label: const Text("Tank3"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomPrimaryButton(
                    buttonColor: mainColor,
                    showLoading: _btnLoading,
                    textValue: 'Submit',
                    textColor: white,
                    onClick: () async {
                      final Map<String, dynamic> _data = {
                        "id_vache": _vacheIdController.text,
                        "qte": _quantityController.text,
                        "ph": _phController.text,
                        "matiere_grasse": _mGrasseController.text,
                        "densite": _densiteController.text,
                      };
                      setState(() {
                        _btnLoading = true;
                      });

                      await LaitRepository.getInstance().ajoutLait(
                        data: _data,
                        idTank: _selectedTank,
                        laitState: _selectedLaitState,
                      );

                      setState(() {
                        _btnLoading = false;
                      });
                      Navigator.of(context).pop();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
