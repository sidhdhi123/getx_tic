import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller.dart';

class third extends StatelessWidget {
  Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("Tic-Tac-Toe",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Obx(() => Text("${c.turn}",
                    style: TextStyle(color: Colors.white, fontSize: 30))),
                // child: Text("${c.turn}",
                //     style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  des(0),
                  des(1),
                  des(2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  des(3),
                  des(4),
                  des(5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  des(6),
                  des(7),
                  des(8),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Obx(() => Text("${c.status}",style: TextStyle(color: Colors.white, fontSize: 27),)),
                // child: Text(
                //   "${c.status}",
                //   style: TextStyle(color: Colors.white, fontSize: 27),
                // ),
              ),
            ),
            InkWell(
              onTap: () {
                c.repeat();
              },
              child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 90, right: 90, bottom: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff412E65).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: Colors.white),
                      Text(
                        "Repeat",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )),
            )
          ],
        ),
      )),
    );
  }

  des(int i) {
    return Expanded(
        child: InkWell(
      onTap: () async {
        c.did_tap(i);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xff412E65).withOpacity(0.77),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Obx(() => Text("${c.str[i]}", style: TextStyle(color: c.col[i], fontSize: 34),)),
        // child: Text(
        //   "${c.str[i]}",
        //   style: TextStyle(color: c.col[i], fontSize: 34),
        // ),
      ),
    ));
  }
}
