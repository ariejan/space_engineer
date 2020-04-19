// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:space_engineer/main.dart';
import 'package:space_engineer/redux/app/app_reducers.dart';
import 'package:space_engineer/redux/app/app_state.dart';

void main() {
//  testWidgets('Counter increment score by 10', (WidgetTester tester) async {
//    final store = Store<AppState>(
//      appReducer,
//      initialState: AppState.initial(),
//    );
//
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(StoreProvider(store: store, child: AppWidget(store)));
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('10'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.text("Mine 1 astroid"));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('10'), findsOneWidget);
//  });
}
