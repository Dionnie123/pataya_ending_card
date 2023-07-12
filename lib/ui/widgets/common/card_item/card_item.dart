import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pataya_ending_card/app/extensions/ecard_extension.dart';
import 'package:pataya_ending_card/app/extensions/string_extension.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/app_colors.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';

class CardItem extends StatelessWidget {
  final ECard card;

  const CardItem(
    this.card, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${card.teamOneName ?? ""} vs. ${card.teamTwoName ?? ""} "
                    .toTitleCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              /*    hSpaceSmall,
              if (card.winnerSlot() != null)
                const Icon(
                  Icons.star_rounded,
                  color: Colors.orange,
                ) */
            ],
          ),
          vSpaceSmall,
          if (card.title != null) Text((card.title ?? "").toTitleCase()),
          vSpaceSmall,
          if (card.date != null)
            Text(
                DateFormat('EEE, MMM. d y h:mm a')
                    .format(card.date ?? DateTime.now()),
                style: const TextStyle(overflow: TextOverflow.ellipsis)),
          vSpaceSmall,
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              if (card.teamOneScore != null && card.teamTwoScore != null)
                Container(
                  decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                      "Score : ${card.teamOneScore ?? ""} ${card.teamTwoScore != null ? "- ${card.teamTwoScore}" : ""}"),
                ),
              if (card.countOccupiedSlots() > 0)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Slots: ${card.countOccupiedSlots()}/99"),
                ),
              if (card.countOccupiedPaidSlots() > 0)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                      "Paid: ${card.countOccupiedPaidSlots()}/${card.countOccupiedSlots()}"),
                ),
              if (card.betAmount != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Bet: ${card.betAmount}"),
                ),
              if (card.prize != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Prize: ${card.prize}"),
                ),
            ],
          )
        ],
      ),
    );
  }
}
