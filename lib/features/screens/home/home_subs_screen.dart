import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/home_widgets/home_card_1.dart';
import 'package:trackizer/core/widgets/home_widgets/home_card_2.dart';
import 'package:trackizer/core/widgets/home_widgets/statistics_home_card.dart';
import 'package:trackizer/core/widgets/main_logo.dart';
import 'package:trackizer/features/screens/settings/settings_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  double _gaugeValue = 75;
  int currentIndex = 0;

  List<Subscription> subscriptions = [];

  Map<String, dynamic>? userStats;

  bool isLoading = true;
  bool isStatsLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserStats();
    fetchSubscriptions();
  }

  void navy(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  Future<void> fetchSubscriptions() async {
    final url = Uri.parse(
      'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions',
    );

    final response = await http.get(
      url,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        subscriptions = jsonData.map((e) => Subscription.fromJson(e)).toList();
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('فشل في جلب الاشتراكات')));
    }
  }

  Future<void> fetchUserStats() async {
    final url = Uri.parse(
      'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_statistics_summary',
    );

    final response = await http.get(
      url,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print('USER STATS RESPONSE: ${response.body}');

      if (data.isNotEmpty) {
        final stats = data[0];
        final percentage = stats['this_month_bills_percentage'];

        if (!mounted) return;
        setState(() {
          userStats = stats;

          _gaugeValue = (userStats?['this_month_bills_percentage'] ?? 0)
              .toDouble();
          isStatsLoading = false;
        });
      } else {
        if (!mounted) return;
        setState(() {
          isStatsLoading = false;
        });
      }
    } else {
      if (!mounted) return;
      setState(() => isStatsLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('فشل في جلب الإحصائيات')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.myBackground,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 58,
                      right: 24,
                      left: 24,
                      bottom: 24,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff282833),
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                      startAngle: -5 * pi / 4,
                                      sweepAngle: 3 * pi / 2,
                                    ),
                                    DottedCircle(
                                      dotCount: 80,
                                      radius: 160,
                                      dotRadius: 2,
                                      dotColor: Color(
                                        0xffffffff,
                                      ).withOpacity(0.05),
                                      startAngle: -5 * pi / 4,
                                      sweepAngle: 3 * pi / 2,
                                    ),
                                    DottedCircle(
                                      dotCount: 100,
                                      radius: 195,
                                      dotRadius: 1.5,
                                      dotColor: Color(
                                        0xffffffff,
                                      ).withOpacity(0.05),
                                      startAngle: -pi, // من اليسار
                                      sweepAngle: pi, // إلى اليمين
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
                                    axisLineStyle: const AxisLineStyle(
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
                                        widget: Column(
                                          children: [
                                            const SizedBox(height: 64),
                                            const MainLogo(
                                              width: 107,
                                              height: 19,
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              isStatsLoading
                                                  ? '...'
                                                  : '${userStats!['this_month_bills']} SP',
                                              style: TextStyle(
                                                color: AppColors.myWhite,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            const Text(
                                              'This month bills',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff83839C),
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              height: 32,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: const Color(0xff3D3D47),
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
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatisticsHomeCard(
                              title: "Active subs",
                              value: isStatsLoading
                                  ? '-'
                                  : '${userStats!['active_subs']}',
                              topLineColor: AppColors.myOrange,
                            ),
                            StatisticsHomeCard(
                              title: 'Highest subs',
                              value: isStatsLoading
                                  ? '-'
                                  : '${userStats!['highest_sub']} SP',
                              topLineColor: AppColors.myPurple,
                            ),
                            StatisticsHomeCard(
                              title: 'Lowest subs ',
                              value: isStatsLoading
                                  ? '-'
                                  : '${userStats!['lowest_sub']} SP',
                              topLineColor: AppColors.myGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 21),

                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff0E0E12),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: const Color(0xff1B1B21),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(207, 207, 252, 0.15),
                          width: 0.5,
                        ),
                      ),

                      indicatorPadding: EdgeInsetsGeometry.symmetric(
                        horizontal: -24,
                        vertical: 4,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      dividerColor: Colors.transparent,
                      labelColor: AppColors.myWhite,
                      unselectedLabelColor: Color(0xffA2A2B5),
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

                  SizedBox(height: 150,
                    child: TabBarView(
                      children: [
                        isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                
                                itemCount: subscriptions.length,
                                itemBuilder: (context, index) {
                                  final sub = subscriptions[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: HomeCard1(
                                      title: sub.name,
                                      price:
                                          '${sub.price.toStringAsFixed(2)} SP',
                                      imagePath: sub.image,
                                    ),
                                  );
                                },
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

              // Positioned(
              //   child: SvgPicture.asset('assets/icons/Settings.svg'),
              //   top: 40,
              //   right: 24,
              // ),
              HeaderWithIcons(
                text: '',
                icons: [
                  HeaderIcon(
                    assetPath: 'assets/icons/Settings.svg',
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 24, top: 32),
                    onTap: navy,
                  ),
                ],
              ),
            ],
          ),
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
      final angleStep = circle.sweepAngle / circle.dotCount;

      for (int i = 0; i < circle.dotCount; i++) {
        final angle = circle.startAngle + i * angleStep;

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

  final double startAngle; // زاوية البدء (بالراديان)
  final double sweepAngle; // مدى القوس (بالراديان)

  DottedCircle({
    required this.dotCount,
    required this.radius,
    required this.dotRadius,
    required this.dotColor,

    this.startAngle = 0, // افتراضي: تبدأ من اليمين
    this.sweepAngle = 2 * pi, // افتراضي: دائرة كاملة
  });
}

class Subscription {
  final String image;
  final String name;
  final double price;
  final String? description;

  Subscription({
    required this.image,
    required this.name,
    required this.price,
    this.description,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      image: json['image'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }
}
