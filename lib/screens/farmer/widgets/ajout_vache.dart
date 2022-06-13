import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/data/remote/vache_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AjoutVache extends StatefulWidget {
  const AjoutVache({Key? key}) : super(key: key);

  @override
  State<AjoutVache> createState() => _AjoutVacheState();
}

class _AjoutVacheState extends State<AjoutVache> {
  bool _milkingInput = false;
  bool _loading = false;
  final TextEditingController _vacheIdController = TextEditingController();
  final TextEditingController _vacheNomController = TextEditingController();
  final TextEditingController _vacheDateNaissanceController =
      TextEditingController();
  final TextEditingController _vachePoidsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  'Ajout Vache',
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
                    labelText: 'ID No',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _vacheNomController,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2025));

                          if (picked != null) {
                            final DateFormat formatter =
                                DateFormat('yyyy-MM-dd');

                            setState(() {
                              _vacheDateNaissanceController.text =
                                  formatter.format(picked);
                            });
                          }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: _vacheDateNaissanceController,
                          decoration: const InputDecoration(
                            labelText: 'Date Naissance',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            _milkingInput = !_milkingInput;
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text(
                                _milkingInput == true
                                    ? 'Milking'
                                    : 'Not Milking',
                                style: regular16pt.copyWith(color: white),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _vachePoidsController,
                  decoration: const InputDecoration(
                    labelText: 'Poids',
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
                    showLoading: _loading,
                    textColor: white,
                    onClick: () async {
                      final Map<String, dynamic> _data = {
                        'name': _vacheNomController.text,
                        'date_naissance': _vacheDateNaissanceController.text,
                        'cin_user': '123456',
                        'poids': _vachePoidsController.text,
                        'date_chaleur': '2020/01/01',
                      };

                      setState(() {
                        _loading = true;
                      });

                      await VacheRepository.getInstance().ajoutVache(_data);

                      setState(() {
                        _loading = false;
                      });
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
