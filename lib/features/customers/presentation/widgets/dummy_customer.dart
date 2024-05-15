import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/phone_icon.dart';

class DummyCustomer extends StatelessWidget {
  const DummyCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: screenHeight * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.038),
              blurRadius: 12,
            )
          ],
          border: Border.all(
            color: const Color.fromARGB(19, 145, 145, 145),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 100,
                  width: 104,
                  child: Image.asset(
                    'assets/images/man_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              color: Color.fromARGB(36, 0, 0, 0),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nesto Hypermarket',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'ID : 3',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'West Palazhi, Calicut, Kerala',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                 PhoneIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
