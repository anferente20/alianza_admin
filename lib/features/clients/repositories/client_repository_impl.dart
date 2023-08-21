import 'package:alianza_admin/core/errorrs/failure.dart';
import 'package:alianza_admin/features/clients/data_source/client_data_source.dart';
import 'package:alianza_admin/features/clients/model/client.dart';
import 'package:alianza_admin/features/clients/repositories/client_repository.dart';
import 'package:either_dart/src/either.dart';

class ClientRepositoryImpl extends ClientRepository {
  ClientRepositoryImpl({required this.clientDataSource});

  final ClientDataSource clientDataSource;

  @override
  Future<Either<Failure, List<Client>>> getClients() async {
    try {
      final clients = await clientDataSource.getClients();
      return Right(clients);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Client>>> searchClients(String sharedKey) async {
    try {
      final clients = await clientDataSource.searchClient(sharedKey);
      return Right(clients);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Client>>> addClient(Client client) async {
    try {
      final clientAddedd = await clientDataSource.addClient(client);
      return Right(clientAddedd);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
