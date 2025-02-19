import 'package:nyxx/nyxx.dart';
import 'package:test/test.dart';

void main() {
  test('PermissionOverwriteBuilder', () {
    final builder = PermissionOverwriteBuilder(id: Snowflake.zero, type: PermissionOverwriteType.member);

    expect(
      builder.build(),
      equals({'type': 1}),
    );

    final builder2 = PermissionOverwriteBuilder(
      id: Snowflake.zero,
      type: PermissionOverwriteType.role,
      allow: Permissions.addReactions | Permissions.connect,
      deny: Permissions.administrator,
    );

    expect(
      builder2.build(),
      equals({
        'type': 0,
        'allow': '1048640',
        'deny': '8',
      }),
    );
  });
}
