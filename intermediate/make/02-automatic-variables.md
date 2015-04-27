---
layout: lesson
root: ../..
title: 자동 변수와 와일드카드
level: intermediate
---

앞장에서 보여준 규칙(rule)은 거의 쉘에서 실행하는 명령어 같다: 입력과 출력 파일 이름이 명시적으로 각 명령에 목록으로 나타난다. 규칙에 반복되는 파일 이름을 회피하기 위해서 특별한 단축 표기법을 어떻게 사용하는지 이번 장에서 학습할 것이다.
그리고 훨씬 더 간략하고 읽기 좋게 만들 것이다.


학습 목표
----------
* 규칙의 목표대상, 첫번째 전제조건, 모든 전제조건에 대한 단축 표기법을 학습한다.
* 와이드카드가 파일 그룹을 매칭하는 방법을 학습한다.
* 상기 두가지 방법을 통해 규칙 작성을 단순화하는 방법을 설명한다.

규칙 출력에 대한 속기(shorthand)
----------------------------------

논문으로 돌아가서 또다른 의존성 그래프 부분을 살펴보자.
`summary-1.dat` 파일은 `data-1-1.dat`, `data-1-2.dat` ... 모든 파일에 의존성을 갖는다.
파일 갯수는 고정되어 정해지지 않았다: 파일이 하나일 수도 있고, 십여개일 수도 있고, 수천개일 수도 있다.
정확하게 파일 세개에 대해서 규칙을 작성하는 것은 쉽다 &mdash; 한 줄에 한 목표대상과 다수 전제조건이 있다.

~~~
# multiple.mk
~~~
{:class="in"}

~~~
summary-1.dat : data-1-1.dat data-1-2.dat data-1-3.dat
    python stats.py summary-1.dat data-1-1.dat data-1-2.dat data-1-3.dat
~~~
{:class="in"}

하지만, 이것을 임의 파일 갯수로 어떻게 하면 일반화할 수 있을까?
그리고, 어떻게하면 반복되는 파일이름을 제거할 수 있을까?
`data-1-1.dat data-1-2.dat data-1-3.dat`을 두번 작성하는 것은 사서 고생하는 것과 다름이 아니다: 조만간 파일에 한 줄 추가하고 다른 줄을 갱신하는 것을 잊어버릴 것이다.
설사 사전에 얼마나 많은 파일이 있을지 알수는 없다 하더라도, "모든 파일을 `data-1-something.dat`"와 같이 표현하는 방식이 필요하다.
또한, `figure-2.svg` 그림 파일과 이 파일에 의존성을 갖는 파일을 어떻게 할 것인지 해결해야 한다.
규칙은 정확하게 `figure-1.svg`과 전제조건에 관해 동일한다; 중복하여 복사하는 것은 사서 고생하는 것과 다름이 없다.

`data-1-1.dat`, `data-1-2.dat`, `data-1-3.dat` 데이터 파일 세개를 갖는 경우로 시작하자.
앞서 살펴봤듯이, 데이터 파일 중 하나 혹은 `stats.py` 스크립트가 변경될 때마다 `summary-1.dat`을 갱신하는 
`Make' 규칙을 작성하는 것은 쉽다.

하지만, 더 낫게 만들고 싶다. 그래서, 규칙에 있는 동작(action)을 교체하자.

~~~
# target-variable.mk
~~~
{:class="in"}

~~~
summary-1.dat : data-1-1.dat data-1-2.dat data-1-3.dat
    python stats.py $@ $^ #data-1-1.dat data-1-2.dat data-1-3.dat
~~~
{:class="in"}

규칙 동작(action)에 `summary-1.dat` 이름을 넣는 대신에 다소 암호스러운 축약어 `$@`을 사용한다.
이것은 `Make'의 [자동변수(automatic variables)](../../gloss.html#automatic-variable) 중 하나로,
"현재 규칙의 목표 대상"을 의미한다. 예를 들어, 이 규칙에서는 `summary-1.dat`을 의미한다.
(더이상 이 이름에 대한 가독성이 좋은 좀더 긴 형태는 없다: 단지 많은 `Make` 흠결 중의 하나다)


규칙에 있는 전제조건에 대한 와일드카드와 속기(shorthand)
-----------------------------------------------------------
목표대상 이름을 반복하는 대신에 `$@`사용해서 다소 규칙을 간략할 수 있었다.
하지만, 많은 전제조건 파일이름을 두번 작성하는 것은 여전히 중복으로 불필요하다.
다음과 같이 규칙 명령을 간략화된 규칙으로 바꿔서 이 문제를 해결하자.

~~~
# variables.mk
~~~
{:class="in"}

~~~
summary-1.dat : data-1-1.dat data-1-2.dat data-1-3.dat
    python stats.py $@ $^
~~~
{:class="in"}

`$^`은 또다른 자동 변수다: 의미하는 바는 "이 규칙에 있는 모든 전제조건"이 된다.
상기 예제에서 원 데이터 파일 세개로 'Make'가 `stats.py $@ $^`에 있는 변수를 확장할 때,
원래 명령어로 되돌아 간다.

물론 또 다른 자동 변수도 있다: 예를 들어, `$<`이 의미하는 바는 
"리스트에 있는 첫번째 전제조건"이 되고, 
`$?`은 "최신이 아닌 모든 전제조건"이 된다. 만약 모두 기억하지 못한다고 걱정하지 마라:
가장 열정적인 `Make` 사용자를 제외하고 모든 사람들은 포스트잇에 적어 놓고 터미널에 옮겨 작성한다.

자동 변수 `$@`와 `$^`을 사용해서 규칙에 있는 중복되는 불필요한 것을 제거한다.
하지만, 임의 전제조건 파일 갯수를 다루는 문제를 해결하지는 못한다.
프로젝트가 완료되기 전에 데이터 파일이 세개 이상 될 것으로 예상된다.
앞에서 언급했듯이, 매번 실험을 수행할 때마다, `Makefile`을 다시 작성하고 싶지는 않다.
정말 원하는 바는 쉘에서 `*` 와일드카드 같은 것으로 임의 문자갯수를 매칭하는 것이다.

~~~
# wildcard.mk
~~~
{:class="in"}

~~~
summary-1.dat : data-1-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

상기 명령어는 실제로 동작한다: 만약 규칙 전제조건으로 `data-1-*.dat`을 사용하면, 상응하는 쉘 와일드카드처럼 동작한다.
이와 같이 실행할 때, `$^`을 *필히* 사용해서 동작(action)에 규칙 전제조건을 참조하게 한다:
정확하게 무슨 파일이름이 매칭될지는 모른다. 그래서, 사용자를 대신해서 규칙에 기반해서 'Make'가 자동 변수로 파일명을 넣도록 해야 한다.

다음에 지금까지 의존성 나무(dependency tree)와 전체 `Makefile`이 나와있다.

~~~
paper.pdf : paper.tex figure-1.svg figure-2.svg
        cat $^ > $@
~~~
{:class="in"}

~~~
figure-1.svg : summary-1.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
figure-2.svg : summary-2.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
summary-1.dat : data-1-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

~~~
summary-2.dat : data-2-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

여전히 반복되는 중복이 약간 존재한다: 데이터 파일 두개에 대해서 동일한 논리적 규칙을 갖지만, 
파일 이름에 '1'과 '2'가 다르기 때문에 별도로 작성해야 한다. 다음 절에서 이것을 고치는 방법을 살펴볼 것이다.


전제조건 자동 목록에 출력되지 말아야 하는 추가적인 의존성
-----------------------------------------------------------------------------------------

하지만, 그전에 다루어야 되는 한가지 더 문제가 있다. 현재 `Makefile`에는 
`summary-1.dat`과 `summary-2.dat`가 `stats.py` 프로그램과 해당 원 데이터 파일에 의존성이 있다는 것을 잡아내지는 못하고 있다. 이 문제를 전제조건 리스트 목록에 `stats.py` 프로그램을 추가해서 고칠 수 있다.

~~~
paper.pdf : paper.wdp figure-1.svg figure-2.svg
        cat $^ > $@
~~~
{:class="in"}

~~~
figure-1.svg : summary-1.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
figure-2.svg : summary-2.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
summary-1.dat : stats.py data-1-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

~~~
summary-2.dat : stats.py data-2-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

하지만, 이것을 수행하게 되면, `stats.py`가 두 데이터 파일에 대해 자동변수 `$^`의 값으로 나타난다.
이것이 의미하는 바는 `stats.py`을 실행하게 될 때, 명령 라인은 `stats.py summary-1.dat stats.py data-1-1.dat data-1-2.dat` 같이 될 것이다. 즉, `stats.py` 프로그램에게 데이터 파일로 자신을 처리하게 만드는 모양이 된다. 이것은 거의 확실히 좋은 생각은 아니다. `stats.py`로 하여금 `.py` 확장자를 갖는 파일을 무시하게 해서 이 문제를 "해결"할 수는 있지만, 매끄럽지 못한 해킹이다.

두번째 선택지는 의존성을 한단계 아래로 내리는 것으로 원 데이터파일이 `stats.py`에 의존성을 갖는 것처럼 만드는 것이다.

~~~
figure-1.svg : summary-1.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
figure-2.svg : summary-2.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
summary-1.dat : data-1-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

~~~
summary-2.dat : data-2-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

~~~
data-1-1.dat : stats.py
        touch $@
~~~
{:class="in"}

~~~
data-1-2.dat : stats.py
        touch $@
~~~
{:class="in"}

이것을 [거짓 의존성(false dependency)](../../gloss.html#false-dependency)으로 부른다.
`stats.py`가 변경되었을 때 원 데이터 파일이 정말 갱신될 필요는 없다.
하지만, `Makefile`에 거짓 의존성으로, `stats.py`가 변경될 때 `Make`는 원 데이터 파일에 시간도장 정보를 갱신한다.
따라서, 요약파일 갱신을 일으킬 것이다.

거짓 의존성은 문제 몇개를 해결할 수 있지만, 이번 것은 아니다: 만약 이 경로를 내려가게 된다면, 다시 한번 모든 원 데이터 파일 목록을 나열해야 하는데, 이것은 피하려고 하는 것이다. 세번째 선택지는 `summary-1.dat`와 `summary-2.dat`에 추가 규칙으로 `stats.py`을 전제조건에 추가한다. 하지만 어떤 동작(action)도 하지 않는다.

~~~
paper.pdf : paper.tex figure-1.svg figure-2.svg
        cat $^ > $@
~~~
{:class="in"}

~~~
figure-1.svg : summary-1.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
figure-2.svg : summary-2.dat
    python create_figure.py $@ $^
~~~
{:class="in"}

~~~
summary-1.dat : data-1-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

~~~
summary-2.dat : data-2-*.dat
    python stats.py $@ $^
~~~
{:class="in"}

~~~
summary-1.dat : stats.py
summary-2.dat : stats.py
~~~
{:class="in"}

`Make`가 동일한 목표 대상에 대해서 규칙을 다수 봤을 때,
목표대상의 실제 전제조건 집합으로 모든 규칙의 전제조건 조합을 사용한다.
하지만, 규칙에 자동변수 `$^`은 여전히 그 해당 규칙의 전제조건 목록이다.

이것이 맞다고 보지는 않는다. `Make`가 `$^`로 전체 조합을 통과시킨다.

약간의 해킹이지만, 의미하는 바는 명령-라인이 정확하게 사용자가 원하는 바를 갖는 것이다.
