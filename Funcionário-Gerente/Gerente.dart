
import 'dart:math';
import'Funcionario.dart';
class Gerente extends Funcionario {
  String? nome;
  

  bool mereceaumento(String? nomeDoInfeliz) {
    int possibilidade = Random().nextInt(3);
    print(possibilidade);

    if (possibilidade == 2) {
      print(">-- Seu chefe diz: $nomeDoInfeliz vou pensar");
      return true;
      
    } else {
      print(">-- Seu chefe diz: $nomeDoInfeliz pare de gastar meu tempo.");
      return false;
    }
  }

  bool merecereconhecimento(String nomeDoInfeliz) {
    int possibilidade = Random().nextInt(2);

    if (possibilidade == 2) {
      print(">-- Seu chefe diz: $nomeDoInfeliz vou pensar se você merece infeliz.");
      return true;
    } else {
      print(">-- Seu chefe diz: Reconhecimento? Pare de gastar meu tempo.");
      return false;
    }
  }

  bool mereceferias(String nomeDoInfeliz) {
    int possibilidade = Random().nextInt(2);

    if (possibilidade == 2) {
      print(">-- Seu chefe diz: $nomeDoInfeliz vou pensar se você tem direito infeliz.");
      return true;
    } else {
      print(">-- Seu chefe diz: Você merece, mas estamos com poucas pessoas. Infeliz pare de gastar meu tempo.");
      return false;
    }
  }

  Gerente({String? nome,String? setor}):super(setor:setor){
    this.nome = nome;
  }
}