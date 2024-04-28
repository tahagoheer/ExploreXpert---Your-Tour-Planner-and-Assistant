import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class StepProgressView extends StatelessWidget {
  final double _width;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _completedColor;
  final Color _notCompletedColor;
  final double lineWidth = 3.0;

  const StepProgressView({
    required Key key,
    required int curStep,
    required List<String> titles,
    required double width,
    required Color activeColor,
    required Color completedColor,
    required Color notCompletedColor,
  })  : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = activeColor,
        _completedColor = completedColor,
        _notCompletedColor = notCompletedColor,
        assert(width > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: Column(
        children: <Widget>[
          Row(
            children: _iconViews(),
          ),
          const SizedBox(
            height: 8,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: _titleViews(),
          // ),
        ],
      ),
    );
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      Color circleColor;
      Color lineColor;
      Color iconColor;

      if (i < _curStep) {
        circleColor = _completedColor;
        lineColor = _completedColor;
        iconColor = _completedColor;
      } else if (i == _curStep) {
        circleColor = _activeColor;
        lineColor = _activeColor;
        iconColor = _activeColor;
      } else {
        circleColor = _notCompletedColor;
        lineColor = _notCompletedColor;
        iconColor = _notCompletedColor;
      }

      list.add(
        Container(
          padding: const EdgeInsets.all(2),
          // decoration: BoxDecoration(
          //   /* color: circleColor,*/
          //   borderRadius: const BorderRadius.all(Radius.circular(22.0)),
          //   border: Border.all(
          //     color: circleColor,
          //     width: 2.0,
          //   ),
          // ),
          // child: Icon(
          //   Icons.circle,
          //   color: iconColor,
          //   size: 12.0,
          // ),
        ),
      );

      //line between icons
      // if (i != _titles.length) {
      list.add(
        Expanded(
          child: Container(
            height: lineWidth,
            color: lineColor,
          ),
        ),
      );
      // }
    });

    return list;
  }

  // List<Widget> _titleViews() {
  //   var list = <Widget>[];
  //   _titles.asMap().forEach((i, text) {
  //     list.add(Text(text, style: TextStyle(color: EXColors.primaryDark)));
  //   });
  //   return list;
  // }
}
