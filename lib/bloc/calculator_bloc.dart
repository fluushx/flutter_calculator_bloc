import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'calculator_event.dart';
part 'calculator_state.dart';

//Este bloc trabajará con estos eventos y estados
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  //se inicializa la clase y va a estar llamando el estado incial CalculatorState
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    if (event is ResetAC) {
      //Yield*  es para que se emita el valor del stream, no que emita el stream en si
      yield* _resetAC();
    } else if (event is AddNumber) {
      //retorna la copia que se va a modificar, de manera de no perder nuestro estado
      yield state.copyWith(
          mathResult: (state.mathResult == '0')
              ? event.number
              : state.mathResult + event.number);
    } else if (event is DeteleLastEntry) {
      yield state.copyWith(
          mathResult: state.mathResult.length > 1
              ? state.mathResult.substring(0, state.mathResult.length - 1)
              : '0');
    } else if (event is OperationEntry) {
      yield state.copyWith(
          firstNumber: state.mathResult,
          secondNumber: '0',
          operation: event.operation,
          mathResult: '0');
    } else if (event is CalculateResult) {
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState(
        firstNumber: '0',
        secondNumber: '0',
        operation: 'none',
        mathResult: '0');
  }

  Stream<CalculatorState> _calculateResult() async* {
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    switch (state.operation) {
      case '+':
        yield state.copyWith(
            mathResult: '${num1 + num2}', secondNumber: state.mathResult);
        break;
      default:
        yield state;
    }
  }
}
