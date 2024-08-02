mkdir -p ./test-reports/ 2>/dev/null

flutter test ../integration_test/scenarios/counter_test.dart --machine | tojunit --output ./test-reports/test_result.xml

junit2html ./test-reports/test_result.xml ./test-reports/index.html