---
layout: lesson
root: ../..
title: 기본 작업
level: intermediate
---
학습목표
----------
* 기본적인 `Makefile` 구문 학습한다.
* 명령-라인에서 `make` 실행방법을 학습한다.
* 규칙(rules)과 목표(targets)로 실행 명령을 결정하는 방법을 설명한다.
* 기본설정 목표(target)와 기본설정 Makefile 을 학습한다.

`make`가 어떻게 동작하는지 시연하기 위해서, 다음에 로봇이 작업하는 논문에 대한 의존성 나무(dependency tree)가 있다.
`paper.pdf`는 `paper.wdp` (워드 프로세서 원본 파일)에 의존성을 갖고,
워드 파일은 그림 `figure-1.svg`과 `figure-2.svg`에 의존성을 갖는다.
그림 `figure-1.svg`은 `summary-1.dat`에 의존성을 갖는다.
마찬가지로, 요약 데이터는 `data-1-1.dat`와 `data-1-2.dat` 등에 의존성을 갖는다.
`figure-2.svg`도 유사한 이름을 갖는 파일에 의존성을 갖는다.

`paper.pdf`을 생성하기 위해서, 특정 명령어(아마도 `latexmk`)를 실행해야 한다.
이번 강의 목적으로 `latexmk`가 실질적으로 무엇을 수행하는지는 문제되지 않는다.
더이상 이 명령어를 사용하지는 않는다.
필요한 모든 것은 만약 `paper.tex` 파일이나 SVG 그림 파일에 변경이 생긴다면, 
`paper.pdf` 파일을 다시 빌드(rebuild)해서 생성해야 한다.


그림 파일 `figure-1.svg`를 생성하기 위해서, `python create_figure.py figure-1.svg summary-1.dat`을 실행한다.
다시 한번, `create_figure.py` 파이썬 프로그램이 지금당장 무엇인지는 문제되지 않는다.
문제되는 것은 `figure-1.svg` 파일이 이전 파일이 되어 정보가 갱신되지 않을 때마다 실행할 필요가 있다는 것이다.
즉, 그림 파일이 의존성을 갖는 `summary-1.dat` 보다 더 이전 정보를 갖는 파일이 될 때마다 자동갱신한다.
마지막으로, `summary-1.dat` 파일을 갱신하기 위해서, `data-1-something.dat` 이름의 파일을 입력값으로 받는 작성한 작은 스크립트 `stats.py` 를 실행할 필요가 있다.
미리 얼마나 많은 파일이 있을지 알지는 못한다: 요약할 원파일이 수십 혹은 수백개가 될 것으로 짐작만 할 수 있다.

작은 프로그램 `stats.py`이 기존 예제 문제에 또 한가지를 더한다. 원데이터 파일을 처리하는 새로운 방식을 생각해내면서 항상 `stats.py`을 갱신해 나간다. 또한 버그를 찾고 고치는 것을 좀더 자주한다. 
변경할 때마다,새로운 기능 혹은 버그 수정(bug fix)가 요약값을 변경하는 경우를 대비해서 아마도 `summary-1.dat` 파일을 갱신해야 한다. 따라서, `stats.py` 파일을 `summary-1.dat` 데이터 파일이 의존성을 갖는 리스트 목록에 추가해야 한다.
그래서 `stats.py`에 변경이 생기면 `summary-1.dat` 데이터 파일을 다시 계산하게 자동으로 동작시킨다.

상기 내용은 한번에 소화시키기에는 다소 많다. 그래서, 가장 단순한 조각을 살펴보자. 어떻게 하면, 
`summary-1.dat` 파일에 변경사항이 생길때마다 자동으로 `make`로 하여금 `figure-1.svg`을 다시 생성하게 할 수 있을까?

논문에 사용되는 파일을 담고 있는 디렉토리 내부로 들어가면서 시작해보자.
`ls` 명령어를 사용해서 디렉토리 내부 리스트 목록을 얻는다.
`ls`에 `-1t` 플래그는 한줄에 한 목록만 시간 순서로 정렬되어 출력하도록 한다. 그래서 가장 최근 수정된 파일이 가장 먼저 나오고, 가장 오래전에 수정된 파일이 나중에 나온다.

~~~
$ ls -t *.dat *.svg
summary-1.dat    figure-1.svg
~~~
{:class="in"}

상기 목록 출력 결과를 통해서 `summary-1.dat` 파일이 의존성을 갖는 SVG 파일보다 더 최신임을 알 수 있다.
따라서 SVG 파일을 다시 생성해야 한다. 선호하는 편집기를 사용해서 `hello.mk` 이름으로 파일을 생성하고 파일 내부에 다음 세줄을 적어 넣는다.

~~~
# hello.mk
figure-1.svg : summary-1.dat
    python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

이와 같은 `make` 파일에 대한 환경설정(configuration) 파일을 [Makefile](../../gloss.html#makefile) 이라고 한다.
`#`으로 시작하는 첫번째 라인은 주석(comment)이다. 
(단순한 파일 이름보다 좀더 유의미하게 주석을 작성한다.)
두번째 세번째 줄이 `make`가 무엇을 수행할 것인지 관한 [규칙(rule)](../../gloss.html#rule)이 적혀있다.

첫번째 줄 콜론(`:`) 왼편 파일이름이 규칙의 [목표 대상(target)](../../gloss.html#target)이다.
규칙이 `make`로 하여금 이 해당 파일을 어떻게 갱신하거나 다시 생성하도록 한다.
목표 대상 [전제조건(prerequisites)](../../gloss.html#prerequisite)은 콜론 오른편에 나와있다. 전제조건은 목표대상이 의존성을 갖는 것이 된다.
상기 예제에서 `figure-1.svg` 파일은 단지 하나 전제조건 `summary-1.dat`만 필요하다.

규칙의 두번째 라인은 [동작(action)](../../gloss.html#action)이 된다.
`make`로 하여금 만약 목표 대상이 전제조건 중 어떤 것보다 더 오래되어 이전이라면, 
목표 대상을 최신으로 만들기 위해서 무슨 쉘 명령어를 실행해야 되는지 지정한다.
상기 규칙은 명령어가 하나 있지만, 규칙은 일반적으로 임의 명령갯수를 갖을 수 있다. 

한가지 주목할 점은 규칙에 나와있는 동작(action)은 한 탭 문자로 들여쓰기 *해야한다*.
`make`는 공백 혹은 공백과 탭을 섞은 것도 용납되지 않는다.
(들어가며에 언급되었듯이, 1975년 여름 인턴이 작성하는 것으로 그 당시 상황이 투영되어 있다.)

`Makefile` 파일을 작성했기 때문에, `make`로 하여금 다음 명령 라인에서 작업명령을 실행하게 한다.

~~~
$ gmake -f hello.mk
python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

> 현재, `make`는 가장 대중적인 구현 소프트웨어 `GNU Make`와 거의 동의어가 되었다.
> 하지만, 몇몇 시스템에서 `GNU Make`가 `gmake`로 설치될 수 있고, 
> 명령어 `make`가 이용가능하지 않거나 다른 `Make` 구현이 지칭될 수 있다.
> 그래서 만약 전자가 동작하지 않다면, 후자를 시도해보라.

인자로 `-f hello.mk`이 의미하는 것은 `make`로 하여금 `hello.mk` 파일에 있는 명령을 사용하게 한다.
만약 명령을 실행할 파일을 특정하지 않으면, 현재 디렉토리에 있는 `Makefile`라는 파일을 찾고 만약 `Makefile`이 있다면 이 파일을 사용한다.

`make` 출력결과는 작성한 명령 실행결과를 보여준다.
이것을 수행하는 이유는 `figure-1.svg` 파일에 대해 적어도 전제조건 하나가 `figure-1.svg` 자체보다 더 최신이기 때문이다.
기본값으로 `make`는  파일이 마지막에 변형된 시간을 사용한다.  (파일 내용을 보기 위해서 편집기 파일을 여는 것은 시간도장정보(timestamp)를 변경하지 않지만, 파일 내용물에 변경은 시간도장정보를 변경시킨다.)
`summary-1.dat` 시간도장정보가 `figure-1.svg`보다 최신이기 때문에 `make`는 파일에 작성된 쉘 명령어를 실행해서, 새로운 버젼의 `figure-1.svg` 파일을 생성한다.

`make`를 다시 실행하자.

~~~
$ gmake -f hello.mk
~~~
{:class="in"}

이번에는 어떤 명령도 실행하지 않는다. 목표대상이 전제조건보다 더 최신이기 때문에 아무것도 일어나지 않는 사건이 발생했다.
최신화할 수 있는 어떤 것도 없기 때문에, `make`는 어떤 것도 변경시키지 않는다.

만약 파일마다 한 규칙만 허용된다면, `make`는 손으로 명령어를 타이핑하거나 작은 쉘 스크립트를 작성하는 것보다 나은 점이 없을 것이다. 운좋게도, `make`에는 단 하나 환경설정 파일에 임의 갯수의 규칙을 넣을 수 있다.
다음에 `double.mk`이름의 Makefile 파일이 있는데 `figure-1.svg`와 `figure-2.svg`을 다시 생성할 수 있다.
두 규칙은 파일명에 1과 2가 있는 것을 제외하면 동일한다; 나중에 규칙 두개를 하나로 합치는 방법을 보게될 것이다.

~~~
# double.mk
figure-1.svg : summary-1.dat
    python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

~~~
figure-2.svg : summary-2.dat
    python create_figure.py figure-2.svg summary-2.dat
~~~
{:class="in"}

`touch *.dat`를 실행해서 파일을 방금전에 갱신한 척하자. (유닉스 `touch` 명령어는 파일 내용물을 변경하지 않지만,
마치 변형된 것처럼 시간도장정보를 갱신한다.)
이제 `make` 명령을 실행하면 `figure-1.svg` 파일을 다시 생성하고 &mdash; 그리고 나서 멈춘다.

~~~
$ touch *.dat
$ gmake -f double.mk
python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

왜 `figure-2.svg` 파일은 다시 생성되지 않을까?
정답은 `make`가 [디폴트 규칙(default rule)](../../gloss.html#default-rule)으로 `Makefile`에 첫번째 규칙만 사용한다는 것이다. 달리 지정하지 않는다면, 단지 이 규칙만 실행한다. 
만약 `make`로 하여금 `figure-2.svg` 파일을 다시 생성(빌드, build)하게 하려면, 명시적으로 나타내야 한다.
인자로 `-f double.mk`을 사용해서 `make`로 하여금 어떤 `Makefile`을 사용할지 명시하고 나서, 처리하고자 하는 목표 대상 이름을 지정한다.

~~~
$ gmake -f double.mk figure-2.svg
python create_figure.py figure-2.svg summary-2.dat
~~~
{:class="in"}

다시, 이와 같이 한번에 하나씩 빌드(build)하는 것이 개별 명령어를 타이핑하는 것보다 약간 더 낫다.
하지만, 아주 조금 더 낫다. 한번에 `make`로 하여금 모든 것을 빌드하게 하려면, [가짜 목표대상(phony target)](../../gloss.html#phony-target)을 도입해야 한다.
단지 목표대상 명칭으로 어떤 실제 파일과 대응되지 않는다.
실제로 존재하지 않기 때문에, 최신정보로 갱신될 수 없지만, 다른 것들은 여전히 의존성을 갖는다.
다음에 세번째 `Makefile`, `phoyn.mk`가 있다.

~~~
# phony.mk
~~~
{:class="in"}

~~~
all : figure-1.svg figure-2.svg
~~~
{:class="in"}

~~~
figure-1.svg : summary-1.dat
    python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

~~~
figure-2.svg : summary-2.dat
    python create_figure.py figure-2.svg summary-2.dat
~~~
{:class="in"}

`all` 이름으로 가짜 목표대상을 도입되었는데 , `figure-1.svg`와 `figure-2.svg`에 의존성을 갖는다.
현재 디렉토리에 `all`이라는 이름의 파일이 없기 때문에, 만약 `make all`을 타이핑한다면, `make`는 `all` 목표대상이 최신인지를 결정한다. 그리고 `all`이 `figure-1.svg`와 `figure-2.svg`에 의존성이 있기 때문에,
`make`가 동작해서 두 파일을 갱신하는게 되는게 정확하게 원하는 바다.

다시 데이터 파일을 `touch`하고 `make -f phony.mk all`를 실행하자.
확실하게도 `make`는 `sgr` 명령어를 두번 실행해서 그림 파일 두개를 다시 생성한다.

~~~
$ touch *.dat
$ gmake -f phony.mk
python create_figure.py figure-1.svg summary-1.dat
python create_figure.py figure-2.svg summary-2.dat
~~~
{:class="in"}

> ### 연습문제
>
> You decide that you want to make another figure called `figure-2-copy.svg` that
> is a copy of `figure-2.svg`.  Create a make file that has `figure-2-copy.svg`
> depend on `figure-2.svg` and updates `figure-2-copy.svg` appropriately.
> *Hint*: `cp` is copy in the Unix shell.

One thing to note is that the order in which commands are executed is arbitrary.
`make` could decide to update `figure-2.svg` first, rather than `figure-1.svg`,
because there's no dependency to respect between the two.
`make` could also update them in parallel if it had more than one processor to use&mdash;we'll return to this idea later.

Something else this example shows us is that a single thing can be a target in one rule, and a prerequisite in others.
The dependencies between the files mentioned in the Makefile make up a directed graph.
In order for `make` to run, this graph must not contain any cycles.
For example, if X depends on Y, Y depends on Z, and Z depends on X,
everything depends on something else, so there is nothing `make` can build first.
If it detects a cycle in a Makefile, `make` will print an error message and stop.
Unfortunately, whether or not a cycle exists depends on which files exist,
and `make`'s error message is usually not particularly informative.

The default target and the default Makefile
-------------------------------------------

In the previous section, a phony target `all` was added to make it
easy to remake "all" targets. It turns out that many Makefiles have a
target with this meaning and this name. If a target is not specified
on the command line, `make` will use `all` as the default:

    $ make -f phony.mk
    make: Nothing to be done for 'all'.

Does the name make it special?
No, target `all` is special simply because it specified *first*
in the Makefile. Nevertheless, it is customary to call it just that.

What happens if the Makefile name is not specified using the `-f`
switch? `make` by default will use `Makefile` as the name of the
Makefile. This means that our Makefile should usually be called just
that. Combining the use of the default target and the default Makefile
allows us to remake everything by simply saying `make` (without
further parameters).
