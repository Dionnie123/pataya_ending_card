import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pataya_ending_card/app/extensions/string_extension.dart';
import 'package:pataya_ending_card/app/models/slot.dart';
import 'package:pataya_ending_card/ui/common/app_colors.dart';

class SlotItem extends StatelessWidget {
  final bool isSelected;
  final Slot slot;
  final Function(Slot slot) onTap;
  const SlotItem(this.slot,
      {super.key, required this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    Color? marker() {
      Color x = Colors.transparent;
      if (slot.name != null && slot.isPaid == true && slot.isWinner == true) {
        x = Colors.orange.withOpacity(0.5);
      }
      if (slot.name != null && slot.isPaid == false && slot.isWinner == true) {
        x = Colors.grey.withOpacity(0.5);
      }
      if (slot.name != null && slot.isPaid == true && slot.isWinner == false) {
        x = Colors.blue.withOpacity(0.5);
      }
      if (slot.name != null && slot.isPaid == false && slot.isWinner == false) {
        x = Colors.grey.withOpacity(0.5);
      }

      return x;
    }

    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap(slot);
      },
      child: Card(
        color: marker(),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isSelected ? kcPrimaryColor : Colors.grey,
                width: isSelected ? 2 : 0.5),
            borderRadius: BorderRadius.circular(0.0)),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  color: kcPrimaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      "${slot.id}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                slot.name?.toTitleCase() ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 14, height: 1.2, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
