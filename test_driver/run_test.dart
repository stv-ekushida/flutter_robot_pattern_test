import 'dart:io';

Future<void> main() async {
  print('== テスト開始 ==');

  //デバイスIDリストを取得する
  //xcrun xctrace list devices

  //Simulator
//  const deiviceId = "9310372C-A2A6-48B6-8487-61808CC636B7";

  //iOS Device
  const deiviceId = "00008130-000244860E02001C";

  String command =
      'flutter drive --driver=test_driver/screenshot.dart --target=integration_test/scenarios/counter_test.dart -d $deiviceId';

  var result = await Process.run('bash', ['-c', command]);

  if (result.stderr.isNotEmpty) {
    print('=== エラー発生 ===');
    print(result.stderr);
  }

  final outputFile = File('test_driver/test_output.txt');
  try {
    await outputFile.writeAsString(result.stdout);
    print('ログがファイルに保存されました: ${outputFile.path}');
  } catch (e) {
    print('ファイルへの書き込み中にエラーが発生しました: $e');
  }
  print('== テスト終了 ==');
}
