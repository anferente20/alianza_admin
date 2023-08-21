import 'package:alianza_admin/features/clients/model/client.dart';
import 'package:alianza_admin/features/clients/provider/client_provider.dart';
import 'package:alianza_admin/utils/text_validators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddClientForm extends StatefulWidget {
  const AddClientForm({super.key});

  @override
  State<AddClientForm> createState() => _AddClientFormState();
}

class _AddClientFormState extends State<AddClientForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      return TextValidators().validateName(value);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a name ',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Phone',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: TextFormField(
                    controller: phoneController,
                    maxLength: 10,
                    validator: (value) {
                      return TextValidators().validatePhone(value);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a phone number',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'E-mail',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      return TextValidators().validateEmail(value);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter an email',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ClientProvider>().addClient(Client(
                          businessId: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text));
                      setState(() {
                        context.pop();
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            )
          ],
        ));
  }
}
