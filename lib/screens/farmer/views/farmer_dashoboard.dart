import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:farm_mobile/widgets/histo_chart.dart';
import 'package:farm_mobile/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

class FarmerDashbord extends StatelessWidget {
  const FarmerDashbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Container(
              height: _responsive.getHeight(.35),
              width: _responsive.width,
              padding: const EdgeInsets.only(left: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    VerticalStatCard(
                      title: 'Lait',
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    VerticalStatCard2(
                      title: 'Alimentation',
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    VerticalStatCard(
                      title: 'Crops',
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 15),
          //  summary
          Text("Summary", style: heading16),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedBtn(
                title: "Last Month",
                onPressed: () {},
                isSelected: true,
              ),
              RoundedBtn(
                title: "3 Months",
                onPressed: () {},
              ),
              RoundedBtn(
                title: "6 Months",
                onPressed: () {},
              ),
            ],
          )
          // tags
          ,
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fuel Consumption",
                        style: heading16.copyWith(color: Colors.grey)),
                    const SizedBox(height: 10),
                    Text("4230L",
                        style: regular14pt.copyWith(
                            color: Colors.green, fontSize: 25)),
                  ],
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Working Time",
                        style: heading16.copyWith(color: Colors.grey)),
                    const SizedBox(height: 10),
                    Text("450H",
                        style: regular14pt.copyWith(
                            color: Colors.green, fontSize: 25)),
                  ],
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Worked Hectares",
                        style: heading16.copyWith(color: Colors.grey)),
                    const SizedBox(height: 10),
                    Text("4504ha",
                        style: regular14pt.copyWith(
                            color: Colors.green, fontSize: 25)),
                  ],
                ),
                const SizedBox(width: 15.0),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: _responsive.getHeight(.35),
            width: _responsive.width,
            child: const HistoChart(
                data: [15, 11, 25, 15, 88, 22, 66, 77, 22, 88, 44, 66]),
          )
        ],
      ),
    );
  }
}

class RoundedBtn extends StatelessWidget {
  const RoundedBtn({
    Key? key,
    this.isSelected = false,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final bool isSelected;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? goldenrod : goldenrod.withOpacity(0.5),
          borderRadius: BorderRadius.circular(33.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Text(title, style: heading16.copyWith(color: white)),
      ),
    );
  }
}

class VerticalStatCard extends StatelessWidget {
  const VerticalStatCard({
    Key? key,
    this.title,
    this.backgroundColor = const Color(0xff48294b),
    this.textColor: const Color(0xfff1f1f5),
  }) : super(key: key);

  final String? title;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);

    return SizedBox(
      width: _responsive.getWidth(.45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title ?? "",
            style: heading16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: backgroundColor),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * .5,
                        width: constraints.maxHeight * .5,
                        child: const PieChartExample(
                          data: const [23, 55, 32],
                          radius: 44,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.circle, color: piecolors[0], size: 10),
                          const SizedBox(width: 5),
                          Text("Vente",
                              style: heading16.copyWith(color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: piecolors[0], size: 10),
                          const SizedBox(width: 5),
                          Text("Jeter",
                              style: heading16.copyWith(color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: piecolors[0], size: 10),
                          const SizedBox(width: 5),
                          Text("Autre",
                              style: heading16.copyWith(color: textColor)),
                        ],
                      ),
                    ],
                  );
                })),
          )
        ],
      ),
    );
  }
}

class VerticalStatCard2 extends StatelessWidget {
  const VerticalStatCard2({
    Key? key,
    this.title,
    this.backgroundColor = const Color(0xff48294b),
    this.textColor: const Color(0xfff1f1f5),
  }) : super(key: key);

  final String? title;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);

    return SizedBox(
      width: _responsive.getWidth(.45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title ?? "",
            style: heading16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                // fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: constraints.maxHeight * .8,
                      // width: constraints.maxHeight * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: backgroundColor
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "5.6",
                              style: heading16.copyWith(
                                  fontSize: 33, color: goldenrod),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tons/",
                                  style: headingStandart.copyWith(
                                      color: goldenrod),
                                ),
                                Text(
                                  "3 months",
                                  style: headingStandart.copyWith(
                                      color: goldenrod),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text("Max: 10.5 Ton",
                            style: headingStandart.copyWith(color: goldenrod)),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class SliderPercent extends StatelessWidget {
  const SliderPercent(
      {Key? key,
      required this.title,
      required this.max,
      required this.unit,
      required this.color,
      required this.textColor,
      this.value = .5})
      : super(key: key);

  final String title;
  final double max;
  final String unit;
  final Color color;
  final double value;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: headingStandart.copyWith(color: textColor),
            ),
            Text(
              "$max[$unit]",
              style: headingStandart.copyWith(color: white),
            ),
          ],
        ),
        Container(
          width: (_responsive.getWidth(.45) - 20) * value,
          height: 5,
          color: color,
        ),
      ],
    );
  }
}
