import 'package:event_bloc_tester/event_bloc_tester.dart';
import 'package:event_db/event_db.dart';
import 'package:test/expect.dart';
import 'package:tuple/tuple.dart';

/// Runs a test that makes sure that the provided [models] are able to keep all
/// of the data through the [GenericModel.copy] and serailization
/// ([JsonStringModel.toJsonString]) methods.
///
/// [testGroupName] and [mainTestName] can be specified to change the generated
/// folders for the test.
void genericModelTest({
  required Map<String, Tuple2<GenericModel, GenericModel Function()> Function()>
      models,
  String testGroupName = 'Models',
  String mainTestName = 'copy',
}) {
  SerializableListTester<Tuple2<GenericModel, GenericModel Function()>>(
    testGroupName: testGroupName,
    mainTestName: mainTestName,
    mode: ListTesterMode.noOutput,
    testFunction: (value, tester) async {
      final item = value.item1;
      final itemCopy = value.item2()..copy(item);

      expect(itemCopy.toMap(), item.toMap());

      final itemSerialized = value.item2()
        ..loadFromJsonString(item.toJsonString());

      expect(itemSerialized.toMap(), item.toMap());
    },
    testMap: models,
  ).runTests();
}
