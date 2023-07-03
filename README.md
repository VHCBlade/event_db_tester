# Event Bloc Tester

## Features

This package provides a utilty method genericModelTest

## Usage

Please see the test case and example for example use cases.

```
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
```

Simply create a map with the test name being the key and the value containing the model you want to test.

## Additional information

You can see this package in use in the following projects:

- [VHCSite](https://github.com/VHCBlade/vhcsite)
