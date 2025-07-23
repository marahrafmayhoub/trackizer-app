import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
import 'package:trackizer_ui/core/widgets/home_card_1.dart';
import 'package:trackizer_ui/core/widgets/home_card_2.dart';
import 'package:trackizer_ui/core/widgets/main_logo.dart';
import 'package:trackizer_ui/core/widgets/statistics_home_card.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  double _gaugeValue = 75;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.myBackground,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 58,
                    right: 24,
                    left: 24,
                    bottom: 24,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff282833),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 286,
                        height: 286,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: Size(286, 286),
                              painter: DottedCirclePainter(
                                circles: [
                                  DottedCircle(
                                    dotCount: 45,
                                    radius: 100,
                                    dotRadius: 1.5,
                                    dotColor: Color(
                                      0xffffffff,
                                    ).withOpacity(0.15),
                                  ),
                                  DottedCircle(
                                    dotCount: 80,
                                    radius: 160,
                                    dotRadius: 2,
                                    dotColor: Color(
                                      0xffffffff,
                                    ).withOpacity(0.05),
                                  ),
                                  DottedCircle(
                                    dotCount: 100,
                                    radius: 185,
                                    dotRadius: 1.5,
                                    dotColor: Color(
                                      0xffffffff,
                                    ).withOpacity(0.05),
                                  ),
                                ],
                              ),
                            ),

                            SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.1,
                                    cornerStyle: CornerStyle.bothCurve,
                                    thicknessUnit: GaugeSizeUnit.factor,
                                    color: Color(0xff31313C),
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: _gaugeValue,
                                      width: 0.16,
                                      color: AppColors.myOrange.withOpacity(
                                        0.3,
                                      ),
                                      cornerStyle: CornerStyle.bothCurve,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    RangePointer(
                                      value: _gaugeValue,
                                      width: 0.1,
                                      color: AppColors.myOrange,
                                      cornerStyle: CornerStyle.bothCurve,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      widget: Container(
                                        margin: EdgeInsets.only(top: 64),
                                        child: Column(
                                          children: [
                                            MainLogo(width: 107, height: 19),
                                            SizedBox(height: 16),
                                            Text(
                                              '1,235 SP',
                                              style: TextStyle(
                                                color: AppColors.myWhite,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'This month bills',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff83839C),
                                              ),
                                            ),
                                            SizedBox(height: 24),
                                            Container(
                                              height: 32,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Color(0xff3D3D47),
                                              ),
                                              child: MaterialButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'See your budget',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.myWhite,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      angle: 90,
                                      positionFactor: 0.1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 8),
                      Row(
                        children: [
                          StatisticsHomeCard(
                            title: "Active subs",
                            value: '12',
                            topLineColor: AppColors.myOrange,
                          ),
                          StatisticsHomeCard(
                            title: 'Highest subs',
                            value: '19.99 SP',
                            topLineColor: AppColors.myPurple,
                          ),
                          StatisticsHomeCard(
                            title: 'Lowest subs ',
                            value: '5.99 SP',
                            topLineColor: AppColors.myGreen,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 21),

                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff0E0E12),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Color(0xff1B1B21),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    indicatorPadding: EdgeInsetsGeometry.symmetric(
                      horizontal: -24,
                      vertical: 4,
                    ),
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    labelColor: AppColors.myWhite,
                    unselectedLabelColor: const Color(0xffA2A2B5),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    tabs: const [
                      Tab(text: 'Your subscriptions'),
                      Tab(text: 'Upcoming bills'),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          HomeCard1(
                            title: 'Spotify',
                            price: '5.99 SP',
                            imagePath: 'assets/images/Spotify Logo.png',
                          ),
                          SizedBox(height: 8),
                          HomeCard1(
                            title: 'YouTube Premium',
                            price: '18.99 SP',
                            imagePath: 'assets/images/YT Premium Lgoo.png',
                          ),
                          SizedBox(height: 8),
                          HomeCard1(
                            title: "Microsoft OneDrive",
                            price: '29.99 SP',
                            imagePath: 'assets/images/OneDrive Logo.png',
                          ),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        children: const [
                          HomeCard2(
                            title: 'Spotify',
                            price: '5.99 SP',
                            month: 'Jun',
                            day: '25',
                          ),
                          SizedBox(height: 8),
                          HomeCard2(
                            title: 'YouTube Premium',
                            price: '18.99 SP',
                            month: 'Jun',
                            day: '25',
                          ),
                          SizedBox(height: 8),
                          HomeCard2(
                            title: 'Microsoft OneDrive',
                            price: '29.99 SP',
                            month: 'Jun',
                            day: '25',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: SvgPicture.asset('assets/icons/Settings.svg'),
              top: 40,
              right: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class DottedCirclePainter extends CustomPainter {
  final List<DottedCircle> circles;

  DottedCirclePainter({required this.circles});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (final circle in circles) {
      final angleStep = 2 * pi / circle.dotCount;

      for (int i = 0; i < circle.dotCount; i++) {
        final angle = angleStep * i - pi / 2; // تبدأ من الأعلى

        final dx = center.dx + circle.radius * cos(angle);
        final dy = center.dy + circle.radius * sin(angle);
        final offset = Offset(dx, dy);

        canvas.drawCircle(
          offset,
          circle.dotRadius,
          Paint()..color = circle.dotColor,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DottedCircle {
  final int dotCount;
  final double radius;
  final double dotRadius;
  final Color dotColor;

  DottedCircle({
    required this.dotCount,
    required this.radius,
    required this.dotRadius,
    required this.dotColor,
  });
}
