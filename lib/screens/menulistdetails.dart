import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../widgets/buttonRound.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({Key? key}) : super(key: key);
  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool calisma = false;
  String get sayacText {
    Duration sayac = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inHours %60 ).toString().padLeft(2, '0')}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(sayac.inHours % 60).toString().padLeft(2, '0')}:${(sayac.inMinutes % 60).toString().padLeft(2, '0')}:${(sayac.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void ses() {
    if (sayacText == '00:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  /*late int parapuan;
  void parap() {
    parapuan = 0;
    if (sayacText == '03.00.00') {
      parapuan += 10;
    }
  }*/

  double zamanlama = 1.0;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 90));
    controller.addListener(() {
      ses();
      if (controller.isAnimating) {
        setState(() {
          zamanlama = controller.value;
        });
      } else {
        setState(() {
          zamanlama = 1.0;
          calisma = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Çalış",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            margin: EdgeInsets.only(left: 200.0, right: 20.0, top: 20),
            padding: EdgeInsets.only(left: 0.0, top: 3.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.control_point_duplicate,
                    color: Colors.white, size: 30.0),
                Text(
                  "Para puan :0",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Righteous'),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    value: zamanlama,
                    strokeWidth: 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:120),
                  child: Text("Ayarlamak için dokunun.",style: TextStyle(fontFamily: 'Oswald',fontSize: 18),),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      sayacText,
                      style: TextStyle(
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text("'Çatışman ne kadar zorsa, zaferin de o kadar şereflidir!'",style:TextStyle(fontSize: 15,fontFamily: 'Righteous'),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        calisma = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);

                      setState(() {
                        calisma = true;
                      });
                    }
                  },
                  child: RoundButton(
                    icon: calisma == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      controller.reset();
                      setState(() {
                        calisma = false;
                      });
                    },
                    child: RoundButton(icon: Icons.stop_circle_sharp))
              ],
            ),
          )
        ],
      ),
    );
  }
}
