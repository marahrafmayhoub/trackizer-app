import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';

class HalfCircleBudgetGauge extends StatelessWidget {
  final double value;
  final double max;

  const HalfCircleBudgetGauge({
    super.key,
    required this.value,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: SfRadialGauge(enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            
            startAngle: 180,
            endAngle: 0,
            minimum: 0,
            maximum: max,
            showTicks: false,
            // showLabels: true,
            // interval: 60.5,
            radiusFactor: 1.1,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.15,
              cornerStyle: CornerStyle.bothFlat,
              thicknessUnit: GaugeSizeUnit.factor,
              color: AppColors.myGrey,
              // color: Colors.grey.withOpacity(0.2),
            ),
            pointers: [
              RangePointer(
                value: value,
                width: 0.15,
                cornerStyle: CornerStyle.bothCurve,
                sizeUnit: GaugeSizeUnit.factor,
                gradient: const SweepGradient(
                  colors: [
                    Color(0xff71AA27), // Turquoise
                    Color(0xffFF8500),
                    Color(0xffA513FF),
                  ],
                  // stops: [0.0, 0.5, 1.0],
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,
                positionFactor: 0.1,
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${value.toStringAsFixed(2)} SP',
                      // '82,97 SP',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'of ${max.toStringAsFixed(0)} SP budget',
                      // 'of 2,000 SP budget',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
