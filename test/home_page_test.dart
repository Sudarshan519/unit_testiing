import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:reqres/app/modules/home/controllers/home_controller.dart';
import 'package:reqres/app/modules/home/views/home_view.dart';

setupHomeDependency() async {}

void main() {
  setUp(() {});
  testWidgets('check widgets rendered', (WidgetTester tester) async {
    Get.put(HomeController());

    await tester.pumpWidget(MaterialApp(home: HomeView()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle(Duration(seconds: 5));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // await tester.pumpAndSettle();

    // expect(find.byType(ListTile), findsWidgets);
    // expect(find.text('Signup'), findsOneWidget);
    // expect(find.text('login'), findsOneWidget);
  });
}
