import 'package:alianza_admin/core/palette/palette.dart';
import 'package:alianza_admin/features/clients/model/client.dart';
import 'package:alianza_admin/features/clients/provider/client_provider.dart';
import 'package:alianza_admin/ui/widgets/modals/custom_modals.dart';
import 'package:alianza_admin/ui/widgets/sidebar/sidebar.dart';
import 'package:alianza_admin/ui/widgets/table/custom_cell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  List<Client> clientsToShow = [];
  @override
  Widget build(BuildContext context) {
    final clients = context.watch<ClientProvider>();
    clientsToShow = clients.initialLoading ? [] : clients.clients;
    return Scaffold(
        body: clients.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
            : ClientsView(
                clients: clientsToShow,
              ));
  }
}

class ClientsView extends StatelessWidget {
  const ClientsView({
    required this.clients,
    super.key,
  });
  final List<Client> clients;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        const Expanded(flex: 1, child: Sidebar()),
        Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 150, left: 100, right: 50),
              color: Palette.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Buttons(),
                    const SizedBox(height: 30),
                    const _SearchBar(),
                    const SizedBox(height: 30),
                    Table(
                        border: TableBorder.all(
                            color: Palette.blueGrey,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          const TableRow(children: [
                            CustomCell(
                              text: 'Shared Key',
                            ),
                            CustomCell(
                              text: 'Business ID',
                            ),
                            CustomCell(
                              text: 'E-Mail',
                            ),
                            CustomCell(
                              text: 'Phone',
                            ),
                            CustomCell(
                              text: 'Date Added',
                            ),
                          ]),
                          ...clients.map((client) {
                            return TableRow(children: [
                              CustomCell(
                                text: client.sharedKey ?? '',
                              ),
                              CustomCell(
                                text: client.businessId,
                              ),
                              CustomCell(
                                text: client.email,
                              ),
                              CustomCell(
                                text: client.phone,
                              ),
                              CustomCell(
                                text: client.addedDate ?? '',
                              ),
                            ]);
                          })
                        ])
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}

String searchValue = '';

class _SearchBar extends StatefulWidget {
  const _SearchBar();

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = searchValue;
    return Row(
      children: [
        SizedBox(
          width: 350,
          height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        context
                            .read<ClientProvider>()
                            .searchClient(controller.text);
                        searchValue = controller.text;
                      });
                    },
                    child: const Icon(Icons.search)),
                hintText: 'Enter Shared key',
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
                onPressed: () {}, child: Text(" Advanced Search")),
          ),
        )
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {
                    CustomModals().addNewClient(context);
                  },
                  icon:
                      const Icon(Icons.add, color: Palette.blueGrey, size: 30),
                  label: const Text(
                    'New',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.import_export,
                      color: Palette.blueGrey, size: 30),
                  label: const Text('Export',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ],
    );
  }
}
