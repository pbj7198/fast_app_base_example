import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import 'd_number.dart';
import 'w_switch_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // bool isPushOn = false;
  //
  // @override
  // void initState() {
  //   // 이 화면을 열 때만 Prefs에 있는 값을 가져온다.
  //   isPushOn = Prefs.isPushOn.get();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: '설정'.text.make(),
        ),
        body: ListView(
          children: [
            //switch
            Obx(
              () => SwitchMenu(
                '푸시 설정',
                Prefs.isPushOnRx.get(),
                onChanged: (isOn) {
                  Prefs.isPushOnRx.set(isOn);
                },
              ),
            ),

            // BigButton(
            //   '테스트',
            //   onTap: () => Nav.push(SettingScreen()),
            // )
            Obx(() => Slider(
                value: Prefs.sliderPosition.get(),
                onChanged: (value) {
                  Prefs.sliderPosition.set(value);
                  // Prefs.sliderPosition(value); 함수의 call을 호출하게 된다.
                })),
            //slider

            Obx(
              () => BigButton(
                '날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}',
                onTap: () async {
                  //showDataPicker는 Future함수이기 때문에 async처리 필수
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days));
                  if (date != null) {
                    Prefs.birthday.set(date);
                  }
                },
              ),
            ),
            //date time

            Obx(
              () => BigButton(
                '저장된 숫자 ${Prefs.number.get()}',
                onTap: () async {
                  // int를 넘겼기 때문에 받는 쪽에서도 int를 받게 된다.
                  final number = await NumberDialog().show();
                  if (number != null) {
                    Prefs.number.set(number);
                  }
                },
              ),
            ),
            //number
          ],
        ));
  }
}
