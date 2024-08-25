import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/theme/spacing.dart';
import 'package:flutter/material.dart';

class NoItem extends StatelessWidget {
  const NoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no_data.png",
            width: 200,
          ),
          const SizedBox(height: Spacing.s),
          Text(l10n!.empty)
        ],
      ),
    );
  }
}
