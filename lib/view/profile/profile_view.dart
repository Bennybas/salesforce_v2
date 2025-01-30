import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/setting_row.dart';
import '../../common_widget/title_subtitle_cell.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool positive = false;

  List insightArr = [
    {"image": "assets/img/p_personal.png", "name": "Clinical Knowledge", "value": "85%"},
    {"image": "assets/img/p_achi.png", "name": "Message Delivery", "value": "72%"},
    {"image": "assets/img/p_activity.png", "name": "Needs Analysis", "value": "65%"},
    {"image": "assets/img/p_workout.png", "name": "Value Communication", "value": "78%"}
  ];

  List metricsArr = [
    {"image": "assets/img/p_contact.png", "name": "Customer Engagement", "value": "88%"},
    {"image": "assets/img/p_privacy.png", "name": "Objection Handling", "value": "70%"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "In Call Analysis",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Row(
              //   children: [
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(30),
              //       child: Image.asset(
              //         "assets/img/u2.png",
              //         width: 50,
              //         height: 50,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     const SizedBox(width: 15),
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Active Call",
              //             style: TextStyle(
              //               color: TColor.black,
              //               fontSize: 14,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //           Text(
              //             "Duration: 12:45",
              //             style: TextStyle(
              //               color: TColor.gray,
              //               fontSize: 12,
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //     SizedBox(
              //       width: 70,
              //       height: 25,
              //       child: RoundButton(
              //         title: "End Call",
              //         type: RoundButtonType.bgGradient,
              //         fontSize: 12,
              //         fontWeight: FontWeight.w400,
              //         onPressed: () {},
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(height: 15),
              const Row(
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "65%",
                      subtitle: "Talk Ratio",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "8.5/10",
                      subtitle: "Engagement",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "High",
                      subtitle: "Quality",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Call Quality Analysis",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 250,
                      child: _buildCallQualityChart(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Key Insights",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: insightArr.length,
                      itemBuilder: (context, index) {
                        var iObj = insightArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: "${iObj["name"]} - ${iObj["value"]}",
                          onPressed: () {},
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recording",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/img/p_notification.png",
                                height: 15,
                                width: 15,
                                fit: BoxFit.contain
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "Call Recording Active",
                                style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            CustomAnimatedToggleSwitch<bool>(
                              current: positive,
                              values: [false, true],
                              dif: 0.0,
                              indicatorSize: Size.square(30.0),
                              animationDuration: const Duration(milliseconds: 200),
                              animationCurve: Curves.linear,
                              onChanged: (b) => setState(() => positive = b),
                              iconBuilder: (context, local, global) {
                                return const SizedBox();
                              },
                              defaultCursor: SystemMouseCursors.click,
                              onTap: () => setState(() => positive = !positive),
                              iconsTappable: false,
                              wrapperBuilder: (context, global, child) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        left: 10.0,
                                        right: 10.0,
                                        height: 30.0,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: TColor.secondaryG),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(50.0)),
                                          ),
                                        )
                                    ),
                                    child,
                                  ],
                                );
                              },
                              foregroundIndicatorBuilder: (context, global) {
                                return SizedBox.fromSize(
                                  size: const Size(10, 10),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: TColor.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black38,
                                            spreadRadius: 0.05,
                                            blurRadius: 1.1,
                                            offset: Offset(0.0, 0.8))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCallQualityChart() {
    final List<CallQualityData> chartData = [
      CallQualityData('Clinical\nKnowledge', 85, Color(0xFF4CAF50)),
      CallQualityData('Message\nDelivery', 72, Color(0xFF2196F3)),
      CallQualityData('Needs\nAnalysis', 65, Color(0xFFFFC107)),
      CallQualityData('Value\nComm.', 78, Color(0xFF9C27B0)),
      CallQualityData('Customer\nEngagement', 88, Color(0xFFFF5722)),
      CallQualityData('Objection\nHandling', 70, Color(0xFF795548)),
    ];

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 100,
        interval: 20,
        labelFormat: '{value}%',
      ),
      series: <CartesianSeries>[
        BarSeries<CallQualityData, String>(
          dataSource: chartData,
          xValueMapper: (CallQualityData data, _) => data.category,
          yValueMapper: (CallQualityData data, _) => data.percentage,
          pointColorMapper: (CallQualityData data, _) => data.color,
          width: 0.7,
          borderRadius: BorderRadius.circular(10),
        )
      ],
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: '',
        canShowMarker: false,
        format: 'point.x : point.y%',
      ),
    );
  }
}

class CallQualityData {
  final String category;
  final double percentage;
  final Color color;

  CallQualityData(this.category, this.percentage, this.color);
}