import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  final List<String> itemList;
  final Function(String) onRadioValueChanged;

  RadioGroup(this.itemList, this.onRadioValueChanged);

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State<RadioGroup> {
  // Default Radio Button Item
  String radioItem = "";

  // Group Value for Radio Button.
  int id = 0;

  @override
  void initState() {
    super.initState();
    radioItem = widget.itemList.elementAt(0);
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.itemList
          .map((data) => Container(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      radioItem = data;
                      id = widget.itemList.indexOf(data);
                      widget.onRadioValueChanged(data);
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Radio(
                          activeColor: Colors.black,
                          groupValue: id,
                          value: widget.itemList.indexOf(data),
                          onChanged: (val) {
                            setState(() {
                              radioItem = data;
                              id = widget.itemList.indexOf(data);
                              widget.onRadioValueChanged(radioItem);
                            });
                          },
                        ),
                      ),
                      Text("$data")
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
