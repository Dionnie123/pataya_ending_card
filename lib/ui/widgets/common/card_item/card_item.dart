import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/extensions/string_extension.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
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
          /*    if (card.date != null)
            Text(
                DateFormat('EEE, MMM. d y h:mm a')
                    .format(card.date ?? DateTime.now()),
                style: const TextStyle(overflow: TextOverflow.ellipsis)), */

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "SCORE  : ${card.teamOneScore ?? ""} ${card.teamTwoScore != null ? "- ${card.teamTwoScore}" : ""}"),
              vSpaceSmall,
              const Text("SLOTS   : 24/99"),
              vSpaceSmall,
              const Text("PAID    : 7/9"),
            ],
          )
        ],
      ),
    );
  }
}
