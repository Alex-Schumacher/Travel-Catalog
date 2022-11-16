import 'package:url_launcher/url_launcher.dart';

Future<void> launchMaps(double lat, double lng) async {
  var urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';

  if (await canLaunch(urlAppleMaps)) {
    await launch(urlAppleMaps);
  } else {
    throw 'Could not launch Maps';
  }
}
