part of 'calculator_bloc.dart';

@immutable
//Eventos que mi bloc a esperar que extiendan de CalculatorEvent
abstract class CalculatorEvent {}

//Esta clase extiende de nuestro Evento CalculatorEvent
//Cuando se recibe un evento de tipo AddNumber, se debe definir el comportambiento
class AddNumber extends CalculatorEvent {
  final String number;

  AddNumber(this.number);
}

class ResetAC extends CalculatorEvent {}

class ChangeNegativePositive extends CalculatorEvent {}

class DeteleLastEntry extends CalculatorEvent {}

class OperationEntry extends CalculatorEvent {
  final String operation;

  OperationEntry(this.operation);
}

class CalculateResult extends CalculatorEvent {}
