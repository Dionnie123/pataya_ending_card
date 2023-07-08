import 'package:pataya_ending_card/app/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/models/slot.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:stacked_services/stacked_services.dart';

import '../_core/ez_button.dart';

class ResultDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ResultDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? winningSlotId = request.data['winningSlotId'] as String?;
    final Slot? winnerSlot = request.data['winnerSlot'] as Slot?;

    Widget winner() {
      return Center(
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.star_rounded,
                      size: 120,
                      color: Colors.orange,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${winnerSlot?.id}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${winnerSlot?.name}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    Widget loser() {
      return Center(
        child: Column(
          children: [
            const Icon(Icons.thumb_down_rounded, size: 50),
            vSpaceSmall,
            Text(
              "$winningSlotId",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            vSpaceRegular,
            const Text(
              "No Winner",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
            child: Container(
              width: 300,
              constraints: BoxConstraints(
                  minHeight: 0, maxHeight: screenHeight(context) * 0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (winnerSlot != null) winner(),
                  if (winnerSlot == null) loser(),
                  vSpaceRegular,
                  EzButton.elevated(
                    title: "Got it",
                    onTap: () {
                      completer.call(
                        DialogResponse(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
