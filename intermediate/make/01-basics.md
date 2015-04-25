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



Let's start by going into the directory containing the files we're using in the paper,
and use the `ls` command to get a listing of what's there.
The `-1t` flag to `ls` tells it to list things one per line, ordered by age, with the youngest file first and the oldest last:

~~~
$ ls -t *.dat *.svg
summary-1.dat    figure-1.svg
~~~
{:class="in"}

This listing tells us that our data file `summary-1.dat` is newer than the SVG file that depends on it,
so the SVG file needs to be re-created.
Using our favorite editor, let's create a file called `hello.mk` and put these three lines in it.

~~~
# hello.mk
figure-1.svg : summary-1.dat
    python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

A configuration file for `make` like this one is called a [Makefile](../../gloss.html#makefile).
The first line, starting with `#`, is a comment.
(Our comments should be more meaningful than just the name of the file.)
The second and third lines are a [rule](../../gloss.html#rule) that tell `make` what we want to do.

The filename on the left of the colon in the first line is the [target](../../gloss.html#target) of the rule.
The rule tells `make` how to update or re-create this file.
The target's [prerequisites](../../gloss.html#prerequisite)&mdash;the things it depends on&mdash;are listed to the right of the colon.
In our case, `figure-1.svg` only has one prerequisite, `summary-1.dat`.

The second line of the rule is its [action](../../gloss.html#action).
This tells `make` what shell command or commands to run to bring the target up to date if it is older than any of its prerequisites.
This rule only has one command, but a rule can contain any number.

One thing to note is that the actions in rules *must* be indented with a single tab character.
`make` will not accept spaces, or mixes of spaces and tabs.
(As we said in the introduction, it was written by a summer intern in 1975, and sometimes that shows.)

Now that we've created our `Makefile`, we can tell `make` to execute its
instructions by running it from the command line:

~~~
$ gmake -f hello.mk
python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

> Nowadays, `make` is almost synonymous with the most popular implementation, GNU Make.
> But on some systems GNU Make may be installed as `gmake`, and the command
> `make` be either unavailable, or point to a different Make implementation.
> So if the former doesn't work for you, try the latter name as well.

The arguments `-f hello.mk` tell `make` that we want it to use the commands in the file `hello.mk`.
If we don't tell it what file to look in,
it looks for a file called `Makefile` in the current directory and uses that if it exists.

`make`'s output shows us that it has run the command we wanted it to.
It did this because at least one prerequisite for `figure-1.svg` was newer than `figure-1.svg` itself.
By default, `make` uses the time a file was last modified as its age.
(Opening a file in an editor to view it doesn't change this timestamp, but any change to its contents will.)
Since `summary-1.dat`'s timestamp was younger than `figure-1.svg`'s,
`make` ran the shell command we gave it and created a new version of `figure-1.svg`.

Let's run `make` again:

~~~
$ gmake -f hello.mk
~~~
{:class="in"}

This time, it doesn't execute any commands.
This happened&mdash;or didn't&mdash;because the target is newer than its prerequisites.
Since there's nothing to bring up to date, `make` doesn't change anything.

If we were only allowed one rule per file,
`make` wouldn't be any simpler than typing commands by hand or putting them in little shell scripts.
Luckily, `make` allows us to put any number of rules in a single configuration file.
Here is another Makefile called `double.mk` with rules to re-create
both `figure-1.svg` and `figure-2.svg`.
These rules are identical except for the 1's and 2's in the filenames; we'll see later how to combine these rules into one.

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

Let's pretend we've just updated our data files by running `touch *.dat`.
(The Unix `touch` command doesn't change the contents of files, but updates their timestamps as if they had been modified.)
Now, when we run `make`, it re-creates `figure-1.svg` again&mdash;and then stops:

~~~
$ touch *.dat
$ gmake -f double.mk
python create_figure.py figure-1.svg summary-1.dat
~~~
{:class="in"}

Why wasn't `figure-2.svg` re-created?
The answer is that `make` uses the first rule in the Makefile as its [default rule](../../gloss.html#default-rule).
Unless it's told otherwise, it only executes this rule.
If we want `make` to rebuild `figure-2.svg`, we have to tell it so explicitly.
We use `-f double.mk` to tell `make` what Makefile to use,
and then give it the name of the target we want it to handle:

~~~
$ gmake -f double.mk figure-2.svg
python create_figure.py figure-2.svg summary-2.dat
~~~
{:class="in"}

Again, building things one at a time like this is slightly better than typing individual commands, but only slightly.
To get `make` to build everything at once, we have to introduce a [phony target](../../gloss.html#phony-target).
This is just a target name that doesn't correspond to any actual file.
Since it doesn't actually exist, it can't ever be up to date, but other things can still depend on it.
Here's our third Makefile, `phony.mk`:

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

We've introduced a phony target called `all`, which depends on `figure-1.svg` and `figure-2.svg`.
Since there's no file called `all` in the current directory,
if we type `make all`,
`make` will decide that the `all` target is out of date.
And since `all` depends on `figure-1.svg` and `figure-2.svg`,
`make` will go and update them both, which is exactly what we want.

Let's `touch` our data files again, and run `make -f phony.mk all`.
Sure enough, `make` runs the `sgr` command twice to re-create both figures:

~~~
$ touch *.dat
$ gmake -f phony.mk
python create_figure.py figure-1.svg summary-1.dat
python create_figure.py figure-2.svg summary-2.dat
~~~
{:class="in"}

> ### Exercise
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
