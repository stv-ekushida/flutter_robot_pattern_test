import 'package:flutter_robot_test/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robot/my_home_page_robot.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter test', () {
    testWidgets('FABをタップしてカウントアップするテスト', (tester) async {
      await tester.pumpWidget(const MyApp());

      final robot = MyHomePageRobot(tester);

      robot.verify('0');

      await tester.pump(const Duration(microseconds: 500));

      await binding.takeScreenshot('result_1');

      await robot.increment();

      robot.verify('1');

      await binding.takeScreenshot('result_2');
    });
  });
}
