import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FetchError extends StatelessWidget {
  final String? errorMessage;
  final Color? bgColor;
  final void Function()? onRetry;

  const FetchError({super.key, this.onRetry, this.errorMessage, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.normal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.exclamationmark_bubble_fill,
                size: 48,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.5)),
            const SizedBox(height: Spacing.s),
            Text(
              "Error Occured!",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 28),
            ),
            const SizedBox(height: Spacing.s),
            Text(errorMessage ?? "Something went wrong.",
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: bgColor,
                    )),
            SizedBox(height: onRetry != null ? Spacing.normal : 0),
            onRetry != null
                ? CupertinoButton(
                    onPressed: onRetry,
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100),
                    minSize: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Text("Retry",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary)),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
