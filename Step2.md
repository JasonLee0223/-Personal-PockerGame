## ✅  Step2 카드 클래스 구현하기
### **🧑🏼‍💻 작업 목록**   
- [x]  Step1 게임보드 만들기   
- [x]  PR Comment 관련하여 수정하기
- [ ]  Step2 카드 클래스 구현하기
    - [x]  학습자료
        - [x]  스위프트 타입별 메모리분석
    - [ ]  학습목표
        - [x]  OOP방식에 대해 학습하고 필요한 역할을 담당하는 객체를 설계
        - [x]  UniCode에 학습하고 코드에 활용
     - [ ]  기능 요구 사항
         - [x]  카드 데이터를 추상화하여 클래스로 구현하고 단계별로 다양한 상황에 확장해서 사용
         - [x]  클래스 이름, 변수, 함수 이름 Naming 규칙을 만든다.
            - [x]  Naming 관련한 학습자료 확인   
            < 참고사이트 >   
             ****[Bool 변수 이름 제대로 짓기 위한 최소한의 영어 문법](https://soojin.ro/blog/naming-boolean-variables)****   
             ****[Swift 개발자처럼 변수 이름 짓기](https://soojin.ro/blog/english-for-developers-swift)**** 
         - [x]  임의의 카드 객체 인스턴스를 하나 만들어서 출력한다.
     - [x]  프로그래밍 요구사항
         - [x]  객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다.
             - [x]  속성으로 모양 4개 중에서 하나, 숫자 1~13개 중에 하나를 가질 수 있다.
             - [x]  모양이나 숫자도 적당한 데이터 구조로 표현한다.
                - [x]  클래스 혹은 Nested enum타입으로 표현해도 좋다.
                - [x]  어떤 이유로 데이터 구조를 선택했는지 주석(comment)으로 구체적인 설명을 남긴다.
             - [x]  카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
             - [x]  문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.
         - [x]  ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력
         - [x]  데이터를 처리하는 코드와 출력하는 코드를 분리한다.

[포커게임에 대한 로직생각](https://www.notion.so/a252998b580b467fb25d2361e8b4a908)   
[Bool 변수 이름 짓기](https://www.notion.so/Bool-c73e552b45ec4c7c8b50fc21c7514b88)   
[CustomStringConvertible](https://www.notion.so/CustomStringConvertible-e5bdef5cd4f24f8ba11339c9deadcf35)

---
### 🟢 유니코드

ASCII 코드: 미국에서 정의하고 있는 표준으로 1Byte로 표현된다. (알파벳 + 확장문자)

Unicode: 2Byte로 표현되는 여러 문자들을 표현하기 위한 문자셋

문자셋: 약속된 문자의 표현방법

- SBCS: 문자표현에 1Byte
- MBCS: 1Byte로 되면 1Byte, 안되면 2Byte
- WBCS: 모든 문자를 2Byte로 처리, Unicode가 이에 해당된다.
<img src="https://user-images.githubusercontent.com/92699723/156374062-f62cab8b-35c3-4410-9a97-b4a9993d2350.png" width="450" height="200">

참고사이트: [시스템 프로그래밍 - 2부 아스키코드 vs 유니코드](https://velog.io/@jacod2/%EC%8B%9C%EC%8A%A4%ED%85%9C-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-2%EB%B6%80-%EC%95%84%EC%8A%A4%ED%82%A4%EC%BD%94%EB%93%9C-vs-%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C)

---
### 🔴  포커게임에 대한 로직생각
참고사이트:   
[간단한 포커 게임 만들기 1. 튜플(tuple)과 목록을 연결하는 더하기(+) 기호](https://www.bwyoon.com/2018/07/16/%ed%8c%8c%ec%9d%b4%ec%8d%ac-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-19/)   
[간단한 포커 게임 만들기 2. 카드를 섞는(shuffling) 코드와 패가 무엇인지 알아내는 코드](https://www.bwyoon.com/2018/07/17/%ed%8c%8c%ec%9d%b4%ec%8d%ac-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-20/)   
[간단한 포커 게임 만들기 3: 함수 만들기](https://www.bwyoon.com/2018/07/25/%ed%8c%8c%ec%9d%b4%ec%8d%ac-%ed%94%84%eb%a1%9c%ea%b7%b8%eb%9e%98%eb%b0%8d-21/)

포커게임의 기본은 선수들이 나눠가진 카드 패(hand)의 순위(rank)를 정하는 것.   
패(hand)는 포커게임의 종류에 따라 5개 또는 7개의 카드를 받기도하고, 5개의 카드는 공유하고 각자 2개의 
카드를 받아   
결국은 각자 7개의 카드를 받는 등 몇 가지가 있다. 

---
### ✅  프로퍼티

Deck -  게임용 카드 한 팩   
Suit
- Shape   
  - ‘♥️’♦️’♠️’♣️’
- SuitNumber 
  - `1 ~ 13'
  - SpecialNumber - ‘A = 1’ ‘J = 11’ ‘Q = 12’ ‘K = 13’   
Card (suit 무늬 & 숫자) - ( 모양, 숫자 ) 튜플형식으로 나타낼 수 있다.
  - (”heart”, 2) = 하트 무늬 , 숫자 2

### ✅  메서드

- 카드를 섞는 shuffling 코드
    
    ```swift
    deck = [(suit, k)  for suit in ["Heart", "Space", "Clover", "Diamond"] for k in range(1,14)]
    random.shuffle(deck)
    print(deck)
    
    cards = [deck[k] for k in range(5) ]
    print(cards)
    ```
    
- 패가 무엇인지 알아내는 checking 코드   
<img src="https://user-images.githubusercontent.com/92699723/156373731-ccb02aa7-254f-4d62-a51a-01a8bd0af3dc.png" width="400" height="300">

### 실행결과
<img src="https://user-images.githubusercontent.com/92699723/156373670-4deeedf8-82cb-4d59-9c52-dfbd508c271a.png" width="200" height="100">

---