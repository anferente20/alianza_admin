import 'package:alianza_admin/features/clients/data/local_clients.dart';
import 'package:alianza_admin/features/clients/model/client.dart';

import 'client_data_source.dart';

class ClientDataSourceImpl extends ClientDataSource {
  ClientDataSourceImpl();

  @override
  Future<List<Client>> getClients() async {
    try {
      final List<Client> clients =
          local_clients.map((e) => Client.fromJson(e)).toList();
      return clients;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Client>> searchClient(String sharedKey) async {
    try {
      final List<Client> clients = local_clients
          .map((e) => Client.fromJson(e))
          .where((client) => client.sharedKey!.contains(sharedKey))
          .toList();
      return clients;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Client>> addClient(Client client) async {
    try {
      final List<Client> clients =
          local_clients.map((e) => Client.fromJson(e)).toList();
      clients.add(client);
      return clients;
    } catch (_) {
      rethrow;
    }
  }
}
