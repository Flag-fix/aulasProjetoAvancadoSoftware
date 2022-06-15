import 'package:robo_trader/aulas/aula6/aula6.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  group('teste da funcao calcularedia', () {
    test('nota1 negativo - deve gerar exception', () {
      expect(() => calcularMedia(-1,10), throwsException);
    });
    test('a media deve ser 6 ', () {
      expect(calcularMedia(6,7), 6.5);
    });
  });
}