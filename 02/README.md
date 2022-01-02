## week 2 (control_flow_&_data_processing)
Memory로부터 값을 받아 이를 이용해 원하는 연산을 수행할 수 있다.
Assembly code를 작성할 때 performance를 생각하며 작성한다.
branch 명령어와 conditional execution의 차이를 알아보고 memory를 할당하여 data를 저장할 수 있다.

### Problem1
Strcmp 함수 구현
두 문자열이 같을 경우에는 0x0A를, 그렇지 않을 경우에는 0x0B를 4000번지에 저장함

### Problem2
주어진 배열을 정렬하여 4000번지부터 저장함

### Problem3
11+13+15+⋯27+29를 계산하여 결과값을 4000번지에 저장함
(Loop/일반화 식 n(n+1)/unrolling-> loop 이용)
(Branch와 conditional execution 비교)
