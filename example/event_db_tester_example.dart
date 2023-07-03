import 'package:event_db/event_db.dart';
import 'package:event_db_tester/event_db_tester.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

void main() {
  group('Models', () {
    group('copy', () {
      genericModelTest(models: modelTestCases);
    });
  });
}

final modelTestCases = {
  'Example': () => Tuple2(
        ExampleModel()
          ..first = 'First'
          ..second = 'Second',
        ExampleModel.new,
      ),
  'Fail': () => Tuple2(
        FailModel()
          ..first = 'Fail'
          ..second = 'Terrible',
        FailModel.new,
      )
};

class ExampleModel extends GenericModel {
  String? first;
  String? second;

  @override
  Map<String, Tuple2<Getter<dynamic>, Setter<dynamic>>> getGetterSetterMap() =>
      {
        'first': GenericModel.primitive(() => first, (value) => first = value),
        'second':
            GenericModel.primitive(() => second, (value) => second = value),
      };

  @override
  String get type => 'Example';
}

class FailModel extends GenericModel {
  String? first;
  String? second;

  @override
  Map<String, Tuple2<Getter<dynamic>, Setter<dynamic>>> getGetterSetterMap() =>
      {
        'first': GenericModel.primitive(() => first, (value) => first = value),
        'second': GenericModel.primitive(() => second, (value) => second),
      };

  @override
  String get type => 'Fail';
}
