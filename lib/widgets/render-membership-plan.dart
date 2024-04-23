import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/models/membership-plan.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RenderMemberShipPlan extends StatelessWidget {
  final List<MembershipPlan> membership;
  final int index;
  final Function onTap;
  final bool disable;

  const RenderMemberShipPlan({
    super.key,
    required this.membership,
    required this.index,
    required this.onTap,
    required this.disable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, index == 0 ? 12 : 0, 12, 12),
      padding: marginAll,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _colorFromHex(membership[index].color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            membership[index].name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: titleColor,
            ),
          ),
          Row(
            children: [
              Text(
                currencyFormatter.format(membership[index].price),
                style: TextStyle(
                  fontSize: 15,
                  color: secondColor,
                ),
              ),
              Text(
                ' / ${membership[index].duration != 0 ? "${membership[index].duration} months" : "Whole Life"}',
                style: TextStyle(
                  fontSize: 15,
                  color: textSecondColor,
                ),
              ),
            ],
          ),
          Text(
            membership[index].description,
            style: TextStyle(
              fontSize: 15,
              color: descriptionColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 60,
              ),
              if (!disable)
                GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Get Start",
                          style: TextStyle(
                              fontSize: 15,
                              color: titleColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: titleColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
