import 'package:financeiro/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CountDown extends StatelessWidget {
  const CountDown({
    super.key,
    required this.deadLine,
  });

  final DateTime deadLine;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 374,
            height: 374,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(187)),
              color: StyleCustom.iconBackgoundColor2,
            ),
            child: Container(
              alignment: Alignment.center,
              width: 370,
              height: 370,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(185)),
                color: StyleCustom.iconBackgoundColor1,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Aún faltan',
                      textAlign: TextAlign.center,
                      style: StyleCustom.subTittle),
                  TimerCountdown(
                    format: CountDownTimerFormat.daysHoursMinutesSeconds,
                    daysDescription: 'días',
                    hoursDescription: 'hs',
                    minutesDescription: 'min',
                    secondsDescription: 'seg',
                    colonsTextStyle: StyleCustom.timer,
                    timeTextStyle: StyleCustom.timer,
                    descriptionTextStyle: StyleCustom.body,
                    endTime: deadLine,
                    onEnd: () {
                      print("Timer finished");
                    },
                  ),
                  Icon(
                    Icons.favorite_rounded,
                    size: 52,
                    color: StyleCustom.iconColor,
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
