import 'package:alianza_admin/features/clients/model/client.dart';

abstract class ClientDataSource {
  Future<List<Client>> getClients();
  Future<List<Client>> searchClient(String sharedKey);
  Future<List<Client>> addClient(Client client);
}
