import 'package:alianza_admin/core/errorrs/failure.dart';
import 'package:alianza_admin/features/clients/model/client.dart';
import 'package:either_dart/either.dart';

abstract class ClientRepository {
  Future<Either<Failure, List<Client>>> getClients();
  Future<Either<Failure, List<Client>>> searchClients(String sharedKey);
  Future<Either<Failure, List<Client>>> addClient(Client client);
}
