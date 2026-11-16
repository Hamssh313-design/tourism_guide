import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tourism_guide/main.dart';
import 'package:tourism_guide/provider/auth_provider.dart';
import 'package:tourism_guide/provider/favorite_provider.dart';

void main() {
  testWidgets('App mounts without errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ],
        child: const TourismGuideApp(),
      ),
    );

    expect(find.byType(TourismGuideApp), findsOneWidget);
    await tester.pump(const Duration(seconds: 4));
  });
}
