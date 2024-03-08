import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class VetCard extends StatelessWidget {
  final String doctorName;
  final String clinicName;
  final String location;
  final String phoneNumber;

  VetCard({
    required this.doctorName,
    required this.clinicName,
    required this.location,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          doctorName,
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(clinicName),
            SizedBox(height: 4),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    //MapUtils.openmap(47.628293260721, -122.34263420105);
                  },
                ),
                SizedBox(width: 4),
                Text(location),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.phone,
            color: Colors.blue,
          ),
          onPressed: () async {
            launch('tel://$phoneNumber');
            await FlutterPhoneDirectCaller.callNumber(phoneNumber);
          },
        ),
        onTap: () => _launchMaps(location),
      ),
    );
  }

  void _launchMaps(String location) async {
    String url = 'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
