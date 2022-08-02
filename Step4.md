## ✅  Step4 게임로직 구현하기
### **🧑🏼‍💻 작업 목록**   
- [x]  포커게임(Class)
    - [x]  카드게임 종류와 참가자수에 따라 적절하게 동작
    - [x]  카드 개수나 참가자 인원에 대한 입력을 구현할 필요없다
    - [x]  XCTest를 위한 테스트 타깃을  추가
    - [x]  테스트 코드에서 PockerGame 메소드를 호출해서 동작을 확인
- [x]  딜러(Struct)
    - [x]  포커 딜러가 나눠줄 수 있는 게임 방식을 선택
    - [x]  7카드-스터드 or 5카드-스터드
    - [x]  딜러가 딜러 자신을 포함해서 참여자에게 카드를 나눠주고도, 전체 카드가 남는 경우 계속해서 게임을 진행
    - [x]  한 번 나눠준 카드는 다시 덱에 넣지 않고 카드가 부족할 경우 종료
- [x]  플레이어(Class)
    - [x]  참가자는 딜러를 제외하고 1~4명까지 참여
    - [x]  딜러는 이름이 없고, 참가자는 영문 2~5글자 이내의 이름을 가진다.
      - [x]  인원이 결정되면 랜덤하게 이름을 생성

---
### **🤔 고민과 해결**

- PockerGame이라는 상위 객체에 Dealer 하위 객체를 상속시킨다는게 모순이 있어 변경하였다.
PockerGame을 상위 객체로 놓고 미션을 다시 확인해보니 참가자수와 게임 방식을 딜러에게 전달해줘야한다고 생각이 들었고 처음 코드를 작성하였을때는 오히려 하위 객체 (Player와 Dealer)에서 메세지를 전달하여 게임을 시작하는 모순된 구조로 되어있음을 확인하였습니다.
- 하나의 스텝을 너무 오래 가지고 해결하다보니 생각의 정체가 일어난 것 같습니다...😢  하여 우선 팀원의 해결방법을 보고 많이 따라하여 로직을 이해하는데 초점을 두었습니다. 이후에 다시 직접 코드를 작성해봐야할 것 같다...
  
---
### ☑️ CaseIterable

enum, CaseIterable로 열거형타입 배열처럼 다루기   
CaseIterable → 모든 case값들에 대한 컬렉션을 제공하는 타입   
enum 열거형의 값들을 배열 컬렉션과 같이 순회할 수 있도록 도와주는 프로토콜   
allCases 타입 프로퍼티를 통해 기존 배열에서 사용할 수 있던 map / compactMap / reduce / joined 등   
다양한 고차함수 사용도 가능하며, count/ isEmpty 등의 프로퍼티도 사용가능하게 해준다!   
참고사이트: [swift enum, CaseIterable로 열거형타입 배열처럼 다루기](https://0urtrees.tistory.com/197)

---
### ☑️ Fisher-Yates Shuffle & Knuth - Shuffle Algorithm
- 무작위 순열(random permutation) 만들기
    - 이미 뽑혔던 Element가 안뽑혀야한다. → 기존에 있는 요소인지 체크하는 과정 필요
    → 복잡도 ↑ 성능↓
    - 기존에 뽑았던 요소를 배제하고 이 과정을 반복하는 알고리즘 필요
- Fisher-Yates shuffle algorithm
    - 방법
        1. 1 ~ N 까지의 숫자를 쓴다.
        2. 지워지지 않은 숫자 중 random number K를 고른다.
        3. 남은 숫자의 개수를 세고, 지워지지 않은 숫자 K를 지우고, 그 숫자를 별도의 list에 쓴다.
        4. 모든 숫자가 지워질 때까지 2번 반복
        5. 3번에서 쓴 별도의 List가 최종 random permutation 결과이다.
    - 섞은 결과가 한쪽으로 편향되지 않고, 골고루 잘 섞이는 방법
    - 시간 복잡도: O(n^2)
        - 매 반복마다 남은(지워지지 않거나 선택안된) 숫자를 세는 과정이 필요 - O(n)
        - 랜덤 숫자 선택을 리스트 요소 개수에 비례해서 해야 함 - O(n)

### ☑️ **Knuth Shuffle**

- Fisher-Yates shuffle 의 현대 버전
- 각 반복마다 **남은 element 개수를 셀 필요가 없음** -> `O(n)`
- 별도의 list 가 필요 없음. swap 할거니까
- 핵심 개념
    - 한쪽 끝(앞 혹은 뒤)부터 한자리씩 이동하면서 각 자리에 들어갈 요소를 랜덤하게 뽑음
    - 랜덤 숫자 대상: 그 자리를 포함해서 아직 정하지 않은 자리에 있는 요소들
    - 랜덤하게 뽑힐 대상 리스트를 줄여가면서, 기존에 뽑힌 요소를 배제함
    - 랜덤 함수가 O(1) 의 시간복잡도를 가지면, 전체 알고리즘은 O(n)
- pseudo code – To shuffle an array a of n elements (indices 0..n-1):

```swift
// list 뒷자리부터 한자리씩 섞기
for i from n−1 downto 1 do
     j ← random integer such that 0 ≤ j ≤ i
     exchange a[j] and a[i]
       
// list 앞에서부터 한자리씩 고를 경우
for i from 0 to n−2 do
     j ← random integer such that i ≤ j < n
     exchange a[i] and a[j]
```

- 뽑는 대상 list는 그 자리도 포함(inclusive) 해야한다. - 그래야 원래자리에 그대로 있는 경우도 포함해서 랜덤하게 섞을 수 있음
- 대상 list가 하나 남은 경우는 어차피 뽑아도 그 요소이므로 배제
- for 문 도는 대상 Index 는 **0 ~ n-2** / **1 ~ n-1** 이어야 함
- *Example* : 앞 자리부터 한자리씩 골라 섞는 경우

```swift
var array = [ 1,2,3,4,5 ]
  
for i in 0..<array.count - 1 { // 0 ~ n-2
    let randomIndex = Int.random(in: i..<array.count)
      
    let temp = array[i]
    array[i] = array[randomIndex]
    array[randomIndex] = temp
}
  
print(array)
//[2, 5, 1, 4, 3]
```
참고사이트:   
[Fisher-Yates shuffle - Wikipedia](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle)   
[Shuffle Algorithm : 무작위로 섞기 알고리즘 - Fisher-Yates Shuffle & Knuth Shuffle](https://daheenallwhite.github.io/programming/algorithm/2019/06/27/Shuffle-Algorithm-Fisher-Yates/)

---
