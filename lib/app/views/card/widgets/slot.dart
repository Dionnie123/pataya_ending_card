import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/slot.dart';

class SlotCell extends StatelessWidget {
  final Slot slot;
  final Function(Slot slot) onTap;
  const SlotCell(this.slot, {super.key, required this.onTap});

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
            side: BorderSide(color: Colors.white.withOpacity(0.6), width: 0.5),
            borderRadius: BorderRadius.circular(4.0)),
        margin: EdgeInsets.zero,
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: slot.name != null
                ? slot.isPaid ?? false
                    ? Colors.blue
                    : Colors.blueGrey
                : null,
            gradient: slot.isWinner ?? false
                ? const LinearGradient(
                    colors: [
                      Colors.orangeAccent,
                      Colors.orange,
                      Colors.orangeAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "${slot.id}",
                        child: Text(
                          "${slot.id}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        slot.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12, height: 1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
