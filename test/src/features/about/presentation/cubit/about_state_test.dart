import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

/// 1. [Test Initialization:]
/// Verify that the default values are set correctly.
/// 2. [Test copyWith Method:]
/// Verify that the copyWith method correctly copies the state and overrides only the specified values.
/// 3. [Test Equality:]
/// Verify that two instances with the same values are considered equal.
///

void main() {
  group('AboutState', () {
    test('initial state has correct values:', () {
      const aboutState = AboutState();

      expect(aboutState.version, "");
      expect(aboutState.status, AboutStatus.initial);
    });

    test('supports value comparison', () {
      expect(
        const AboutState(version: "1.0.1", status: AboutStatus.success),
        equals(const AboutState(version: "1.0.1", status: AboutStatus.success)),
      );
    });

    test('props contains the correct values', () {
      expect(
          const AboutState(version: "1.0.1", status: AboutStatus.success).props,
          ["1.0.1", AboutStatus.success]);
    });

    test('copyWith returns a copy with the correct values', () {
      const aboutState =
          AboutState(version: '1.0.0', status: AboutStatus.success);

      // Test with both values
      final aboutState1 =
          aboutState.copyWith(version: "1.0.10", status: AboutStatus.success);
      expect(aboutState1.props, ["1.0.10", AboutStatus.success]);

      // Test with version only
      final aboutState2 = aboutState.copyWith(version: "1.0.15");
      expect(aboutState2.props, ["1.0.15", AboutStatus.success]);

      // Test with status only
      final aboutState3 = aboutState.copyWith(status: AboutStatus.failed);
      expect(aboutState3.props, ["1.0.0", AboutStatus.failed]);

      // Test with niehter
      final aboutState4 = aboutState.copyWith();
      expect(aboutState4.props, aboutState.props);
    });
  });
}
