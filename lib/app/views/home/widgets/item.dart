import 'package:flutter/material.dart';
import '../../../models/ecard.dart';

class ECardItem extends StatelessWidget {
  final ECard card;

  final Function onTap;
  const ECardItem({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "${card.title}",
        style: const TextStyle(
          fontSize: 16,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 1.0),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(),
      child: InkWell(
        onTap: () => onTap(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [title(), const Text("f")],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
