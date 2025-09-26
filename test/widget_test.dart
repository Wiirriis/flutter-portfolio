// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:CesarPortfolio/main.dart';

void main() {
  testWidgets('Portfolio app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the welcome text is displayed.
    expect(find.text('¡Bienvenido!'), findsOneWidget);

    // Verify that navigation buttons are present.
    expect(find.text('Sobre mí'), findsOneWidget);
    expect(find.text('Proyectos'), findsWidgets); // Multiple instances expected
    expect(find.text('Contacto'), findsOneWidget);
    expect(find.text('CV/Resume'), findsOneWidget);

    // Verify unique texts on home screen.
    expect(find.text('Navegación rápida'), findsOneWidget);
    expect(find.text('Senior Software Developer'), findsOneWidget);
  });
}
