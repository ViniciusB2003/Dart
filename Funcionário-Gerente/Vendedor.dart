
import 'Funcionario.dart';

class vendedor extends Funcionario{
  double? vendas;
  double? comissao;
  double? meta;

  double? metas(){
    if (vendas! >= meta!){
      return calcularsalario();

    }else{
      return salario;
    }
  }

  vendedor(double? vendas, double? comissao){
    this.vendas;
    this.comissao;
  }
}