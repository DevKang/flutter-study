# Flutter Firebase & DDD Course [1] – Domain-Driven Design Principles

## **(1) DDD**

## Domain Driven Design 이 어떤 것인지, 왜 이러한 방법론을 사용하는지 리서치 해봅시다.

> 도메인의 사전적 의미는 "정보와 활동의 영역" 을 말하며, 흔히 프로그래머들에게는 어플리케이션 내의 로직들이 관여하는 정보와 활동의 영역이라고 받아들여집니다.

> 가령, 어떤 웹 서비스를 만들 때 회원을 가입하고, 회원을 탈퇴하는 일련의 작업은 "회원" 과 관련된 일련의 작업들이며 여기서 "회원" 이라는 도메인이 있다고 볼 수 있습니다.

> 또 다른 용어로써 "domain layer" 와 "domain login" 이라는 용어가 있습니다. 이는 개발자들에게 일종의 "business logic" 과 동등한 것으로 받아들여져 왔습니다. 이러한 business login 은 비즈니스 주체들(가령 회원, 결제 등) 이 어떤 모델링 된 데이터를 생성하거나 변경하기 위해 서로간에 약속한 높은 수준의 규칙들을 의미합니다.

> 도메인 주도 디자인이란 개발을 함에 있어 위에서 설명한 도메인이 중심이 되는 개발 방식을 말하며, 그 목적은 소프트웨어의 연관된 부분들을 연결하여 계속 해서 진화하는 새로운 모델을 만들어 나가 복잡한 어플리케이션을 만드는 것을 쉽게 해 주는 것에 있습니다.

> DDD의 핵심적인 목표는 Loose Coupling, High Cohesion 으로 각 도메인이 연결성이 적고 높은 정도로 연관되어 보다 가벼운 설계를 위해 탄생하였습니다.

> Domain-driven design also heavily emphasizes the ever-more-popular practice of **continuous integration**, which asks the entire development team to use one shared code repository and push commits to it daily (if not multiple times a day). An automatic process executes at the end of the work day, which checks the integrity of the entire code base, running automated unit tests, regression tests, and the like, to quickly detect any potential problems that may have been introduced in the latest commits.

(source from [https://steemit.com/kr/@frontalnh/domain-driven-design](https://steemit.com/kr/@frontalnh/domain-driven-design))

결론 : 잘 모르겠다!

## **(2) DDD Architecture on Flutter**

## 강좌에서 제안하는 아키텍쳐에서 각 레이어별 역할을 정리해보세요.

![Flutter%20Firebase%20&%20DDD%20Course%20%5B1%5D%20%E2%80%93%20Domain-Driven%20%20a2a538f67a594b75a1dc03886ec7cb1d/Untitled.png](Flutter%20Firebase%20&%20DDD%20Course%20%5B1%5D%20%E2%80%93%20Domain-Driven%20%20a2a538f67a594b75a1dc03886ec7cb1d/Untitled.png)

### Presentation

전부 widget과 widget의 state로 구성되어 있다.

Bloc : 3개의 코어 컴포넌트로 나누어져 있다.

- State - 위젯에 값을 전달한다.
- Events - BLoC의 logic을 발동시키고, 상황에 따라서 raw data를 가져온다.
- BLoC - Presentation layer가 아니다. 들어오는 events를 통해 logic을 수행하고, state를 반환한다.

Presentation layer는 사용자의 눈을 즐겁게 하는 것에만 집중한다. data를 다루는 logic은 절대 이 레이어에서 구현하지 않는다. 심지어 입력이 올바른 것인지 검사하는 것도!

### Application

다른 layer들을 조정하는 역할을 수행한다. data가 어디에서 오든지 간에, 제일 처음 거치는 곳이 바로 이 레이어다.
받은 data로 '다음에 뭘 할까'를 결정하는 것이 이 레이어의 역할이다. domain layer를 통해 input validation을 한다던지, infrastructure를 통해 subscriptions을 관리한다든지 하는 식이다.

### Domain

순수한(?) 중심이라고 할 수 있다. 다른 레이어에 디펜던시가 없다. 다른 레이어들은 모두 domain에 디펜던시가 있다. 다른 레이어에서 일어나는 변화는 도메인에 영향을 주지 않지만, 도메인의 변화는 모든 레이어에 영향을 준다.

business logic이 있는 곳이다.

- Validating data
- Transforming data
- Grouping and uniquely identifying data that belongs together through Entity classes
- Performing complex business logic - 보통 이런 경우는 server에 남겨놓긴 한다.

Execption Handling은 참 화나는 작업인데, DDD의 경우 전부 도메인 레이어의 Failures에서 이루어진다. return과 throw의 통합이 이루어진다.

### Infrastructure

APIs, Firebase libraries, databases and device sensors 과 소통하는 레이어. 세 부분으로 나누어진다.

- data transfer objects (DTO)

  Domain Layer에 있는 entities와 value objects ↔ 외부의 plain data 를 convert 해주는 작업을 한다.
  App 내부에서는 String, int 같이 vaildate 되어 있지 않는 data를 다루지 않고, Firestore에서만 다룰 것이다. DTO가 그것을 convert하는 작업을 한다.

- low-level data sources
  Remote Data sources의 경우 JSON를 DTO로 주고 받는 일을 한다.
  local data sources는 local DB나 기기의 센서에서 data를 fetch한다.
- high level repositories
  It's their job to take DTOs and unruly Exceptions from data sources as their input, and return nice Either<Failure, Entity> as their output.
  → Domain layer 에서 다루는 data를 만들어준다.

### 이렇게 레이어를 통해서 역할을 세분화 해서 얻을 수 있는 이점에 대해서 정리 해봅시다.

- 코드의 가독성을 높인다.
- 기능이 구분되어 있기 때문에, 개발 편의성이 높아지고, 디버깅도 쉬울 것이다.
- 마치 블록처럼 갈아끼우는 작업이 가능하다.
