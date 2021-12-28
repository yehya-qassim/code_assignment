import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:new_york_times_articles/controllers/splash_controller.dart';

import 'package:new_york_times_articles/screens/splash_screen.dart';

class MockSplashController extends Mock
    implements SplashController {}

class MockBuildContext extends Mock
    implements BuildContext {}

void main() {
  late SplashController controller;

  setUp(() {
    controller = MockSplashController();
  });
  testWidgets('Splash screen widget test', (WidgetTester tester) async {

    ///Im passing mocked controller in order not to call the actual method
    await tester.pumpWidget(MaterialApp(home: Splash(mockedController: controller,)));

    final text = find.text('The New York Times');
    final image = find.image(const AssetImage('assets/logo.png'));

    expect(text, findsOneWidget);
    expect(image, findsOneWidget);
  });

}
