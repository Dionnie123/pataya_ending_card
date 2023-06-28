import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('April 24, 2023'.toUpperCase()),
                Text('Atlanta Hawks'.toUpperCase()),
                const Text(
                  'V/S',
                  textAlign: TextAlign.center,
                ),
                Text('GOLDEN STATE'.toUpperCase()),
              ],
            ),
            Icon(
              Icons.sports_basketball_rounded,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('LAST SCORE RESULT'),
                Text('1ST GAME:'),
                Text('2ND GAME:'),
                Text('BET: \$1    WIN: \$70'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
