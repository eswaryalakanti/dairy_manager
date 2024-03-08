import 'package:dairy_parr/functions/vet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions/vet.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Inventory',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.all(0),
            // Add controller
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Orders',
              ),
              Tab(text: 'Vet'),
              Tab(text: 'Products'),
              Tab(text: 'Cattle'),
              Tab(text: 'Trade'),
              Tab(text: 'Tasks'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Contents for Orders
            Container(
              child: Center(
                  child: Text(
                'Orders',
                textAlign: TextAlign.left,
              )),
            ),
            // Contents for Vet
            Container(
              child: Container(
                  child: Column(
                children: [
                  VetCard(
                    doctorName: 'Dr. John Doe',
                    clinicName: 'Happy Paws Veterinary Clinic',
                    location: '123 Main St, Cityville, State',
                    phoneNumber: '123-456-7890',
                  )
                ],
              )),
            ),

            // Contents for Products
            Container(
              child: Center(child: Text('Products')),
            ),
            // Contents for Cattle
            Container(
              child: Center(child: Text('Cattle')),
            ),
            // Contents for Trade
            Container(
              child: Center(child: Text('Trade')),
            ),
            // Contents for Tasks
            Container(
              child: Center(child: Text('Tasks')),
            ),
          ],
        ),
      ),
    );
  }
}
