part of 'calculator_bloc.dart';

//Información que quiero que sea mantenida en mi estado
class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  //Valores inciales de mi estado
  CalculatorState(
      {this.mathResult = '0',
      this.firstNumber = '0',
      this.secondNumber = '0',
      this.operation = 'none'});

  //Regresa un nuevo estado de calculatorState, copyWith es un metodo que se encargar
  //de retornar algo de CalculatorState
  CalculatorState copyWith({
    String? mathResult,
    String? firstNumber,
    String? secondNumber,
    String? operation,
  }) =>
      CalculatorState(
        //si se recibe un mathResult va a ser al nuevo mathResult, de lo contrario
        //si no se recibe un mathResult tomará en valor original del this.mathResult
        //mismo caso se repite para el resto
        mathResult: mathResult ?? this.mathResult,
        firstNumber: firstNumber ?? this.firstNumber,
        secondNumber: secondNumber ?? this.secondNumber,
        operation: operation ?? this.operation,
      );
}
