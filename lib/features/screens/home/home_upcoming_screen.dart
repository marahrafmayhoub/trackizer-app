import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/bottomNavbar.dart';
import 'package:trackizer/core/widgets/home_widgets/home_card_1.dart';
import 'package:trackizer/core/widgets/home_widgets/home_card_2.dart';
import 'package:trackizer/core/widgets/main_logo.dart';
import 'package:trackizer/core/widgets/home_widgets/statistics_home_card.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State(); 
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  double _gaugeValue = 75;
    int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.myBackground,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 58, right: 24, left: 24),
              height: 429,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mybordercolor,
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
                    child: SfRadialGauge(
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
                              color: AppColors.myOrange.withOpacity(0.3),
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
                                        borderRadius: BorderRadius.circular(16),
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
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      ),
    );
  }
}
