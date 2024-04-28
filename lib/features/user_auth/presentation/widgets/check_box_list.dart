import 'package:flutter/material.dart';

class CheckBoxGrid extends StatefulWidget {
  final List<String> titles;
  final int crossAxisCount;

  CheckBoxGrid({Key? key, required this.titles, required this.crossAxisCount})
      : super(key: key);

  @override
  _CheckBoxGridState createState() => _CheckBoxGridState();
}

class _CheckBoxGridState extends State<CheckBoxGrid> {
  Map<String, bool> _checkedValues = {};

  @override
  void initState() {
    super.initState();
    for (var title in widget.titles) {
      _checkedValues[title] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.crossAxisCount,
      childAspectRatio: 1.0,
      children: widget.titles.map((String title) {
        return Container(
          height: 10,
          child: CheckboxListTile(
            title: Text(title),
            value: _checkedValues[title],
            onChanged: (bool? newValue) {
              setState(() {
                _checkedValues[title] = newValue!;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
