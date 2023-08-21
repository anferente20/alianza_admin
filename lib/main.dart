import 'package:alianza_admin/core/router/app_router.dart';
import 'package:alianza_admin/features/clients/data_source/client_data_source_impl.dart';
import 'package:alianza_admin/features/clients/provider/client_provider.dart';
import 'package:alianza_admin/features/clients/repositories/client_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final clientRepository =
        ClientRepositoryImpl(clientDataSource: ClientDataSourceImpl());

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              lazy: false,
              create: (_) => ClientProvider(
                    clientRepository: clientRepository,
                  )..getClients())
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        ));
  }
}
