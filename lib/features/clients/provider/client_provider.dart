import 'package:alianza_admin/features/clients/model/client.dart';
import 'package:alianza_admin/features/clients/repositories/client_repository.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier {
  ClientProvider({required this.clientRepository});

  final ClientRepository clientRepository;

  bool initialLoading = true;
  bool hasFailed = false;
  List<Client> clients = [];

  Future<void> getClients() async {
    initialLoading = true;
    clients = [];
    final res = await clientRepository.getClients();
    res.fold((left) => hasFailed = true, (right) => clients.addAll(right));

    initialLoading = false;
    notifyListeners();
  }

  Future<void> searchClient(String sharedKey) async {
    initialLoading = true;
    final res = await clientRepository.searchClients(sharedKey);
    res.fold((left) => hasFailed = true, (right) => clients = right);

    initialLoading = false;
    notifyListeners();
  }

  Future<void> addClient(Client client) async {
    initialLoading = true;

    final res = await clientRepository.addClient(client);
    res.fold((left) => hasFailed = true, (right) => clients = right);
    initialLoading = false;
    notifyListeners();
  }
}
