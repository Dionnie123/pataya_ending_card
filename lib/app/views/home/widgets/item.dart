import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pataya_ending_card/app/extensions/ecard_extension.dart';
import 'package:pataya_ending_card/app/extensions/string_extension.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import '../../../models/ecard.dart';

class ECardItem extends StatelessWidget {
  final ECard card;

  const ECardItem(
    this.card, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${card.teamOneName ?? ""} vs. ${card.teamTwoName ?? ""} "
                        .toUpperCase(),
                  ),
                  hSpaceSmall,
                  if (card.winnerSlot() != null)
                    const Icon(
                      Icons.star_sharp,
                      color: Colors.orange,
                    )
                ],
              ),
              if (card.title != null) Text((card.title ?? "").toTitleCase()),
              if (card.date != null)
                Text(
                    DateFormat('EEE, MMM. d y h:mm a')
                        .format(card.date ?? DateTime.now()),
                    style: const TextStyle(overflow: TextOverflow.ellipsis)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Score : ${card.teamOneScore ?? ""} ${card.teamTwoScore != null ? "- ${card.teamTwoScore}" : ""}"),
              const Text("Slots   : 24/99"),
              const Text("Paid    : 7/9"),
            ],
          ),
        ],
      ),
    );
  }
}
