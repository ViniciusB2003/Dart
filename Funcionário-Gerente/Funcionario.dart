
class Funcionario {
  String? nomeDoInfeliz;    
  String? idade;
  String? cpf;
  double? salario;
  String? cargo;
  String? setor;
  double? bonus;

  double? calcularsalario(){
    if (cargo != null){
      return salario! + ((bonus!/100)*salario!);
    } else{
      return salario;
    }

  }

  Funcionario({String? nomeDoInfeliz, String? idade, String? cpf, double? salario, String? cargo, String? setor, double? bonus}){
    this.nomeDoInfeliz = nomeDoInfeliz;
    this.idade = idade;
    this.cpf = cpf;
    this.salario = salario;
    this.cargo = cargo;
    this.setor = setor;
    this.bonus = bonus;

  }
}