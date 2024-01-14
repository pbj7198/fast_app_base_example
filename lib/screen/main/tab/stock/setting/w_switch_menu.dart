import 'package:fast_app_base/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'w_os_switch.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;

  final ValueChanged<bool> onChanged;

  // 어떤 값이 넘겨진지 알수 없기 때문에 isOn을 전달
  //final void Function(bool isOn) onTap;

  const SwitchMenu(this.title, this.isOn, {super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.text.make(),
        emptyExpanded,
        OsSwitch(onChanged: onChanged, value: isOn),
      ],
    ).p20();
  }
}
