import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sagar_borkar_tech/app.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    await tester.pump();

    expect(find.text('Sagar Borkar'), findsOneWidget);
  });
}
