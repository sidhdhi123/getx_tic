import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  RxString p1 = "X".obs;
  RxString p2 = "O".obs;
  RxString turn = "X`S TURN".obs;
  RxString status = "Game is Running".obs;
  int cnt = 0;
  List<int> list = <int>[];
  RxList<Color> col = List.filled(9, Colors.black).obs;
  RxList<String> str = List.filled(9, "").obs;
  Random r = Random(9);
  RxBool iswinner = false.obs;
  RxBool isdraw = false.obs;

  did_tap(int i) async {
    print(str[i]);
    if (!iswinner.value) {
      if (cnt < 9) {
        if (cnt % 2 == 0) {
          if (str[i] == "") {
            str[i] = p1.value;
            col[i] = Colors.lightBlue;
            cnt++;
            list.add(i);
            print("one player game: pos: ${i}");

            turn.value = "${p2}`S TURN";
            win(p1.value);
            await Future.delayed(Duration(seconds: 1));

            print(turn.value);
            random_num();
          }
        }
      }
    }
  }

  random_num() {
    if (!iswinner.value) {
      int num = r.nextInt(9);
      while (true) {
        if (list.contains(num)) {
          num = r.nextInt(9);
        } else {
          break;
        }
      }

      str[num] = p2.value;
      col[num] = Colors.pink;
      print("one player game: pos: ${num}");
      list.add(num);
      cnt++;
      turn.value = "${p1}`S TURN";
      print(turn);
      win(p2.value);
      print(num);
    }
  }

  win(String one) {
    if (str[0] == one && str[1] == one && str[2] == one || //012
        str[3] == one && str[4] == one && str[5] == one || //345
        str[6] == one && str[7] == one && str[8] == one || //678
        str[0] == one && str[3] == one && str[6] == one || //036
        str[1] == one && str[4] == one && str[7] == one || //147
        str[2] == one && str[5] == one && str[8] == one || //258
        str[0] == one && str[4] == one && str[8] == one || //048
        str[2] == one && str[4] == one && str[6] == one) { //246
      status.value = "${one} is winner";
      turn.value = "WINN!!";
      iswinner.value = true;
    }
    if (iswinner != true && cnt == 8) {
      status.value = "It`s a draw";
      turn.value = "DRAW!!";
      iswinner.value = true;
    }
  }

  repeat(){

     p1.value = "X";
     p2.value = "O";
     turn.value = "X`S TURN";
     status.value = "Game is Running";
     cnt = 0;
     list = <int>[];
     col.value = List.filled(9, Colors.black);
     str.value = List.filled(9, "");
     r = Random(9);
     iswinner.value = false;
     isdraw.value = false;
  }
}
