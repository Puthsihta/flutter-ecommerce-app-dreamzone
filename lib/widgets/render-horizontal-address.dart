import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/screens/address/address-form-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class RenderHorizontalAddress extends StatelessWidget {
  final List<Address> address;
  final Address? selectedAddress;
  final int index;
  final Function onTap;

  const RenderHorizontalAddress({
    super.key,
    required this.address,
    this.selectedAddress,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: whiteSmoke,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedAddress!.id == address[index].id!
                ? baseColor
                : whiteSmoke,
            width: selectedAddress!.id == address[index].id! ? 1 : 0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: iconColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      address[index].name!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),
                  ],
                ),
                if (selectedAddress!.id == address[index].id!)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AddressFromScreen.routeName,
                        arguments: AddressFromArgument(
                          isCreat: false,
                          address: address[index],
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Icon(
                        Icons.edit,
                        color: baseColor,
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address[index].address!,
              style: TextStyle(
                fontSize: 12,
                color: descriptionColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
