
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:canteen_management/widgets/progress_bar.dart';

void main() {
  group('Progress Indicators', () {
    testWidgets('Circular Progress Indicator has amber color',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Scaffold(body: circularProgress())));

      CircularProgressIndicator circularIndicator =
          tester.widget(find.byType(CircularProgressIndicator));
      expect(circularIndicator.valueColor,
          AlwaysStoppedAnimation<Color>(Colors.amber));
    });

    testWidgets('Linear Progress Indicator has amber color',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Scaffold(body: linearProgress())));

      LinearProgressIndicator linearIndicator =
          tester.widget(find.byType(LinearProgressIndicator));
      expect(linearIndicator.valueColor,
          AlwaysStoppedAnimation<Color>(Colors.amber));
    });
  });
}
