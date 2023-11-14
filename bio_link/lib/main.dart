import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/material/color_scheme.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 19, 61, 88)),
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://scontent.fcgb11-1.fna.fbcdn.net/v/t39.30808-6/250119463_3069885523227374_3447470219410852670_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEWT2vHNsI5e1E88mwyRGnbiLntijYjiYaIue2KNiOJhkMJ6CgRHM2qNVIfZlkcwMrs93l44m9CiYyqdGgDqMQP&_nc_ohc=izspKNlY2bwAX-FgFts&_nc_ht=scontent.fcgb11-1.fna&cb_e2o_trans=q&oh=00_AfBB0-LxkY5Fq5iKx-zGXM0W7COAQDKB8drQR-8k3kHNsw&oe=65587248'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 80),
                backgroundColor: Color.fromRGBO(15, 15, 151, 0.808),
              ),
              onPressed: abrirLinkedlin,
              child: Text('Linkedlin'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 80),
                backgroundColor: Color.fromRGBO(117, 10, 127, 0.808),
              ),
              onPressed: abrirInstagram,
              child: Text('Instagram'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 80),
                backgroundColor: Color.fromRGBO(112, 112, 220, 0.808),
              ),
              onPressed: abrirFacebook,
              child: Text('Facebook'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 80),
                backgroundColor: Color.fromRGBO(152, 53, 22, 0.808),
              ),
              onPressed: abrirGithub,
              child: Text('Github'),
            ),
          ],
        ),
      ),
    ),
  ));
}

void abrirLinkedlin() async {
  const url = 'https://www.linkedin.com/in/vinicius-barbosa-811ba3135';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Não foi possível abrir $url';
  }
}

void abrirInstagram() async {
  const url = 'https://www.instagram.com/viniciusbarbosa500/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Não foi possível abrir $url';
  }
}

void abrirFacebook() async {
  const url = 'https://www.facebook.com/profile.php?id=100006178690018';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Não foi possível abrir $url';
  }
}

void abrirGithub() async {
  const url = 'https://github.com/ViniciusB2003';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Não foi possível abrir $url';
  }
}
