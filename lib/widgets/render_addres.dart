import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/screens/address/address_form_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RenderAddress extends StatelessWidget {
  final List<Address> address;
  final Address? selectedAddress;
  final int index;
  final Function onTap;
  final Function onDelete;

  const RenderAddress({
    super.key,
    required this.address,
    required this.index,
    required this.onTap,
    required this.onDelete,
    required this.selectedAddress,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${address[index].name} ᐧ",
                        style: TextStyle(
                          color: titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (selectedAddress != null)
                        if (selectedAddress!.id == address[index].id)
                          Icon(
                            Icons.check_circle,
                            color: baseColor,
                            size: 15,
                          )
                    ],
                  ),
                  Text(
                    address[index].address!,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: deleteColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(l10n!.delete_address),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                l10n.cancel,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                            CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  onDelete();
                                },
                                child: Text(
                                  l10n.delete,
                                  style: const TextStyle(color: Colors.blue),
                                )),
                          ],
                          content: Text(
                            l10n.delete_address_info(address[index].name!),
                          ),
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit_outlined,
                    color: baseColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AddressFromScreen.routeName,
                      arguments: AddressFromArgument(
                        isCreat: false,
                        address: address[index],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
