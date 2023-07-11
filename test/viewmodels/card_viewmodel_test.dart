import 'package:flutter_test/flutter_test.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CardViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}