import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/material/color_scheme.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: BackgroundImage(),
    ),
  ));
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'C:/Códigos VSCODE/Dart-Hub/bio_link/lib/assets/Constelação.gif',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                    'C:/Códigos VSCODE/Dart-Hub/bio_link/lib/assets/Perfil.jpg'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 80),
                  backgroundColor: Color.fromRGBO(15, 15, 151, 0.808),
                ),
                onPressed: () => abrirLink(
                    'https://www.linkedin.com/in/vinicius-barbosa-811ba3135'),
                child: Text('Linkedlin'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 80),
                  backgroundColor: Color.fromRGBO(117, 10, 127, 0.808),
                ),
                onPressed: () =>
                    abrirLink('https://www.instagram.com/viniciusbarbosa500/'),
                child: Text('Instagram'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 80),
                  backgroundColor: Color.fromRGBO(112, 112, 220, 0.808),
                ),
                onPressed: () => abrirLink(
                    'https://www.facebook.com/profile.php?id=100006178690018'),
                child: Text('Facebook'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 80),
                  backgroundColor: Color.fromRGBO(152, 53, 22, 0.808),
                ),
                onPressed: () => abrirLink('https://github.com/ViniciusB2003'),
                child: Text('Github'),
              ),
            ],
          ),
        ),
        // Adicione outros widgets em cima da imagem de fundo aqui
      ],
    );
  }
}

Future<void> abrirLink(String urlString) async {
  final url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    launchUrl(url);
  } else {
    throw "Erro";
  }
}
