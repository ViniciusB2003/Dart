import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.63dfffcb740f31974715c4c094b18da3?rik=s29eladZMTUhRg&pid=ImgRaw&r=0'),
            ),
            ElevatedButton(
              onPressed: abrirLinkedlin,
              child: Text('Linkedlin'),
            ),
            ElevatedButton(
              onPressed: abrirInstagram,
              child: Text('Instagram'),
            ),
            ElevatedButton(
              onPressed: abrirFacebook,
              child: Text('Facebook'),
            ),
            ElevatedButton(
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
