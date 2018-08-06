part of nyxx;

/// Sent when a role is updated.
class RoleUpdateEvent {
  /// The role prior to the update.
  Role oldRole;

  /// The role after the update.
  Role newRole;

  RoleUpdateEvent._new(Client client, Map<String, dynamic> json) {
    if (client.ready) {
      final Guild guild = client.guilds[new Snowflake(json['d']['guild_id'] as String)];
      this.oldRole = guild.roles[new Snowflake(json['d']['role']['id'] as String)];
      this.newRole = new Role._new(
          client, json['d']['role'] as Map<String, dynamic>, guild);
      client._events.onRoleUpdate.add(this);
    }
  }
}
