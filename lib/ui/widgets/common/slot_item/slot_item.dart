import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pataya_ending_card/app/models/slot.dart';
import 'package:pataya_ending_card/ui/common/app_colors.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';

class SlotItem extends StatelessWidget {
  final bool isSelected;
  final Slot slot;
  final Function(Slot slot) onTap;
  const SlotItem(this.slot,
      {super.key, required this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap(slot);
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isSelected ? kcPrimaryColor : Colors.grey,
                width: isSelected ? 2 : 0.5),
            borderRadius: BorderRadius.circular(0.0)),
        margin: EdgeInsets.zero,
        child: Container(
          //   height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: slot.name != null
                ? slot.isPaid ?? false
                    ? Colors.blue.withOpacity(0.6)
                    : Colors.transparent
                : null,
            gradient: slot.isWinner ?? false
                ? const LinearGradient(
                    colors: [
                      Colors.orangeAccent,
                      Colors.orange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${slot.id}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    hSpaceSmall,
                    if (slot.isWinner ?? false)
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                      ),
                  ],
                ),
                const SizedBox(width: 3),
                Text(
                  slot.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
