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
              backgroundImage: NetworkImage('https://seu-link-para-imagem.com'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://www.link1.com'),
              child: Text('Botão 1'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://www.link2.com'),
              child: Text('Botão 2'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://www.link3.com'),
              child: Text('Botão 3'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://www.link4.com'),
              child: Text('Botão 4'),
            ),
          ],
        ),
      ),
    ),
  ));
}

_launchURL(String url) async {
  var uri = url.parse('www.linkedin.com/in/vinicius-barbosa-811ba3135');
  if (await canLaunchUrl(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir $url';
  }
}
