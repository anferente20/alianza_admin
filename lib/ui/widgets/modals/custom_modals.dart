import 'package:alianza_admin/core/palette/palette.dart';
import 'package:alianza_admin/ui/widgets/forms/add_client_form.dart';
import 'package:flutter/material.dart';

class CustomModals {
  addNewClient(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Palette.modalBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350, maxWidth: 500),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Create New Client',
                      style: TextStyle(fontSize: 24),
                    ),
                    Divider(
                      thickness: 2,
                      color: Palette.blueGrey,
                    ),
                    AddClientForm()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
