import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:open_store/open_store.dart';
import 'package:toast/toast.dart';

class RateDialog extends StatefulWidget {
  const RateDialog({
    super.key,
    this.titleStyle,
    this.contentStyle,
    required this.androidAppId,
    this.iconColor = Colors.amber,
    this.buttoncolor = const Color.fromARGB(255, 10, 105, 182),
  });

  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final String androidAppId;
  final Color iconColor;
  final Color buttoncolor;

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  double ratings = 0;

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Rate us 5 star ',
          textScaler: const TextScaler.linear(1),
          style: widget.titleStyle ??
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          "Support us by giving 5 star and write your review",
          textScaler: const TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: widget.contentStyle ??
              TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actionsOverflowDirection: VerticalDirection.down,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      actions: <Widget>[
        RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
            size: 50,
          ),
          initialRating: 1,
          onRatingUpdate: (rating) {
            ratings = rating;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 19,
          ),
          child: GestureDetector(
            onTap: () {
              if (ratings == 5 || ratings == 4) {
                OpenStore.instance.open(
                  androidAppBundleId: widget.androidAppId,
                );
                Navigator.pop(context);
              } else {
                showToast(
                  "Thank you !",
                  gravity: Toast.bottom,
                  duration: 1,
                );

                Navigator.pop(context);
              }
            },
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  color: widget.buttoncolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "RATE NOW",
                  textScaler: const TextScaler.linear(1),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            showToast(
              "okey !",
              gravity: Toast.bottom,
              duration: 1,
            );
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 30,
            width: 200,
            child: Center(
              child: Text(
                "Maybe later",
                textScaler: const TextScaler.linear(1),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
