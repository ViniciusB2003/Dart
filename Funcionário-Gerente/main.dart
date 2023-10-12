import 'dart:io';
import 'Funcionario.dart';
import 'Gerente.dart';

void main() {
  Funcionario meuPrimeiroFuncionario = Funcionario(nomeDoInfeliz: "João");
  Gerente primeiroGerente = Gerente(nome: "Carlos");
  int tentativa = 0;

  while (tentativa < 4) {
    print(
        "Qual Opção você prefere? 1 - Quer Aumento; 2 - Quer Reconhecimento; 3 - Quer Férias");
    String? op = stdin.readLineSync()!;
    int parsedOp = int.parse(op);
    bool aumento =
        primeiroGerente.mereceaumento(meuPrimeiroFuncionario.nomeDoInfeliz);

    if (parsedOp == 1 && aumento == false) {
      primeiroGerente.mereceaumento(meuPrimeiroFuncionario.nomeDoInfeliz!);
      tentativa += 1;

      print("Entrou na 1");
    } else if (parsedOp == 2) {
      primeiroGerente
          .merecereconhecimento(meuPrimeiroFuncionario.nomeDoInfeliz!);
      tentativa += 1;
      print("Entrou na 2");
    } else if (parsedOp == 3) {
      primeiroGerente.mereceferias(meuPrimeiroFuncionario.nomeDoInfeliz!);
      tentativa += 1;
      print("entrou na 3");
    }
  }
}
