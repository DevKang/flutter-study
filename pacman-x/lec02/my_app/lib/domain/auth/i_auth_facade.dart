import 'value_object.dart';

/*1.1
  Facade Design Pattern에 의해서 아래와 같은 absract class를 만든다.
   client는 abstract class를 통해 complicated한 EmailAddress, Password class의
   내용에 접근하게 된다.
*/
abstract class IAuthFacade {
  Future<void> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password
  });
  Future<void> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password
  });
  Future<void> signInWithGoogle();
}
/*1.2 
  그렇다면 어떻게 Exception을 catch하고 failures로서 반환할까? 이는 infrastructure에서
  처리하게 된다.
*/