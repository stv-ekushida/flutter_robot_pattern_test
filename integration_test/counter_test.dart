import 'package:flutter_robot_test/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'scenarios/robot/my_home_page_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      await tester.pumpWidget(const MyApp());

      final robot = MyHomePageRobot(tester);

      robot.verify('0');

      await robot.increment();

      robot.verify('1');
    });
  });
}
