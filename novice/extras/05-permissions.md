---
layout: lesson
root: ../..
title: 권한 (Permissions)
---

*권한(permissions)*을 사용해서 유닉스는 누가 파일을 읽고, 변경할 수 있고, 실행할 수 있는지 제어한다.
이번 학습 후반부에 윈도우에서 어떻게 권한을 관리하는지도 살펴볼 것이다. 개념은 비슷하지만, 규칙은 다르다.

Nelle과 함께 시작하자. Nelle은 유일한 [사용자명(user name)](../../gloss.html#user-name),
`nnemo`, [사용자 ID(user ID)](../../gloss.html#user-id),
1404을 가지고 있다.

> #### 왜 정수형 ID일까?
>
> 왜 정수형 ID일까?
> 다시 한번 대답은 1970년 초반으로 거슬러 올라간다.
> `alan.turing` 같은 문자열은 길이가 변하고, 다른 문자열과 비교하는 것은 많은 명령어를 필요로 한다.
> 반대로, 정수는 매우 적은 저장공간 (일반적으로 문자 4개)만을 사용하고, 하나의 명령어로 비교를 수행할 수 있다.
> 연산을 빠르고 간단하게 하기 위해서
> 프로그래머는 종종 내부적으로 정수를 사용해서 기록을 하고 
> 정수를 표현을 위해서는 사용자가 친근한 텍스트로 변환하는 일종의 조회(lookup) 테이블을 사용한다.
> 종종 프로그래머는 프로그래머라 사용자 친근한 문자열 부분을 건너뛰고 정수만 사용한다.
> 마치 연구실에서 작업하는 연구자가 "아나콘다에 대한 알파 반응 실험" 대신에 "28번 실험"이라고 부르는 것과 유사하다.

사용자는 [그룹(groups)](../../gloss.html#user-group)에 임의의 숫자만큼 속할 수 있다. 각각의 그룹은 중복되지 않는 [그룹이름(group name)](../../gloss.html#user-group-name)과 숫자형식 [그룹 ID(group ID)](../../gloss.html#user-group-id)를 갖는다.
어느 사용자가 어떤 그룹에 속해있는가하는 목록 정보는 `/etc/group` 파일에 일반적으로 저장된다.
(만약 지금 유닉스 컴퓨터 앞에 있다면, 그 파일을 확인하기 위해서 `cat /etc/group` 명령어를 실행해보자.)

이제 파일과 디렉토를 살펴보자. 유닉스 컴퓨터의 모든 파일과 디렉토리는 하나의 소유자와 하나의 그룹에 속한다. 각 파일의 내용물과 함께 운영시스템은 파일을 소유하는 사용자 숫자 ID와 그룹정보를 저정한다. 

사용자-그룹 (user-and-group) 모델은 각 파일마다 시스템의 모든 사용자는 다음 세가지 범주 중에 하나에 속하게 된다: 파일의 소유자, 파일 그룹의 일원, 그리고 그 밖의 모든 사람. 

이 세가지 범주 각각에 대해서, 컴퓨터는 범주에 있는 사용자가 파일을 일고, 쓰고, 실행(만약 프로그램이라면 실행)할 수 있는지를 기록한다.

예를 들어, 만약 파일이 다음과 같은 권한집합으로 구성된다면,

<table class="table table-striped">
<tr><td></td><th>user</th><th>group</th><th>all</th></tr>
<tr><th>read</th><td>yes</td><td>yes</td><td>no</td></tr>
<tr><th>write</th><td>yes</td><td>no</td><td>no</td></tr>
<tr><th>execute</th><td>no</td><td>no</td><td>no</td></tr>
</table>

의미하는 바는 다음과같다.

*   파일 소유자는 파일을 읽고 쓸 수 있지만, 실행할 수는 없다.
*   파일 그룹의 다른 사용자는 읽을 수는 있지만, 변경하거나 실행할 수는 없다.
*   그 밖의 모든 사람은 어떤 것도 할 수 없다.

실제 동작하는 이 모델을 살펴보자.
`cd` 명령어로 디렉토리를 `labs`으로 변경하고 `ls -F`를 실행하면, `setup` 이름 끝에 `*`를 놓여진다.
`setup`이 실행가능하다는 것을 표현하는 방식이다.
즉, (아마도) 컴퓨터가 실행할 수 있는 무엇이다.

~~~
$ cd labs
$ ls -F
~~~
{:class="in"}
~~~
safety.txt    setup*     waiver.txt
~~~
{:class="out"}

> #### 필요하지만 충분하지는 않다.
>
> 실행가틍하다고 표기가 되었다는 사실이 실질적으로 
> 프로그램의 일종을 담고있다는 의미는 아니다.
> 다음에 소개되는 명령어를 사용하여 지금 작성하고 있는
> HTML 파일을 쉽게 실행가능한 파일로 표시할 수 있다.
> 사용하고 있는 운영시스템에 따라서 "실행(run)"을 하면 실행 실패(왜냐하면, 컴퓨터가 인식할 수 있는 명령집합을 담고 있지 않다.) 혹은 운영시스템이 자동으로 파일을 (웹브라우져) 같은 응용프로그램으로 열게 한다.

이제 `ls -l` 명령을 실행해보자:

~~~
$ ls -l
~~~
{:class="in"}
~~~
-rw-rw-r-- 1 vlad bio  1158  2010-07-11 08:22 safety.txt
-rwxr-xr-x 1 vlad bio 31988  2010-07-23 20:04 setup
-rw-rw-r-- 1 vlad bio  2312  2010-07-11 08:23 waiver.txt
~~~
{:class="out"}

`-l` 플래그는 `ls` 명령어가 장문 형식의 리스트 목록을 출력한다. 
정보가 많아서 차례로 칼럼을 하나씩 살펴보자.

오른쪽에 파일 이름이 있다. 왼쪽으로 이동하면 그 옆에 가장 최근에 변경된 시간과 날짜 정보가 있다. 백업 시스템과 다른 도구는 이 정보를 다양한 방식으로 이용한다. 하지만, 언제 여러분 (혹은 권한을 가진 다른 사람)이 마지막에 파일을 변경했는지 확인하는데 사용한다.

변경시간 옆에 바이트로 파일 크기와 파일 소유자와 그룹이름이 있다. (이 경우 `vlad`가 소유자 `bio`가 그룹이 된다)
지금 두번째 칼럼(각 파일마다 `1`을 표시)은 건너뛴다. 왜냐하면 가장 관심을 가져야 하는 것이 첫번째 칼럼이기 때문이다.
첫번째 칼럼은 파일 권한을 보여준다. 즉, 누가 읽고, 쓰고, 실행할 수 있는지 권한을 보여준다.

권한 문자열 중 하나를 좀더 자세히 살펴보자:
`-rwxr-xr-x`.
첫번째 문자는 무슨 타입(type)인지에 대한 정보를 제공한다. '-'은 정규 파일, 'd'은 디렉토리, 다른 문자는 좀더 소수의 사람만 이해할 수 있는 것을 의미한다.

다음 세 문자는 파일 소유자가 무슨 권한을 가지고 있는지 알려준다. 여기서 파일 소유자는 파일을 읽고, 쓰고, 실행도 할 수 있다: `rwx`.
중간의 세쌍둥이는 그룹 권한을 정보를 보여준다.
만약 권한이 없다면, 대쉬로 표현된다. 그래서 `r-x`은 "일고, 실행은 하지만, 쓸수는 없다."는 의미를 가진다.
마지막 세쌍둥이는 파일의 소유자도 파일의 그룹에 있지도 않은 그빡의 누구나 무엇을 할 수 있는지 보여준다.
이 경우, 다시 `r-x`이여서, 시스템의 그 밖의 모든 사람은 파일의 내용을 볼 수 있고 실행도 할 있지만, 변경할 수는 없다. 
권한을 변경하기 위해서, `chmod` 명령어를 사용한다. (`chmod`는 "change mode"의 약자)
Vlad가 강의하는 과정의 최종 점수에 대한 권한을 보여주는 긴 목록 정보가 다음에 있다.

~~~
$ ls -l final.grd
~~~
{:class="in"}
~~~
-rwxrwxrwx 1 vlad bio  4215  2010-08-29 22:30 final.grd
~~~
{:class="out"}

이럴 수가 있나요: 세상의 모든 사람이 읽을 수 있어요&mdash;그리고, 더욱 상황이 않좋게는 변경도 할 수 있어요.
(거의 확실하게 동작하지 않겠지만, 프로그램으로 성적 파일을 실행할도 수 있어요.)
소유자 권한을 `rw-`으로 변경하는 명령어는 다음과 같다.

~~~
$ chmod u=rw final.grd
~~~
{:class="in"}

'u'는 사용자(즉, 파일 소유자)의 권한을 변경한다는 신호다. 그리고 `rw`는 새로운 권한집합이다.
`ls -l` 명령어는 권한 변경이 동작하는 것을 보여준다. 왜냐하면, 소유자 권한이 이제 읽고 쓰는 것으로 설정이 변경되었다.

~~~
$ ls -l final.grd
~~~
{:class="in"}
~~~
-rw-rwxrwx 1 vlad bio  4215  2010-08-30 08:19 final.grd
~~~
{:class="out"}

그룹 권한을 읽을 수만 있도록 변경하기 위해서 `chmod`을 다시 실행하자.

~~~
$ chmod g=r final.grd
$ ls -l final.grd
~~~
{:class="in"}
~~~
-rw-r--rw- 1 vlad bio  4215  2010-08-30 08:19 final.grd
~~~
{:class="out"}

그리고 최종적으로 그 밖의 모든 사람(파일의 소유자도 그룹원도 아닌 시스템의 모든 사람)에게는 어떠한 권한도 주지 말자. 

~~~
$ chmod a= final.grd
$ ls -l final.grd
~~~
{:class="in"}
~~~
-rw-r----- 1 vlad bio  4215  2010-08-30 08:20 final.grd
~~~
{:class="out"}

'a'는 그 밖의 모든 사람("all")의 권한을 변경한다는 신호를 준다. "=" 오른쪽에 아무것도 없기 때문에, 그 밖의 모든 사람의 권한은 없다.

또한 권한으로 검색도 할 수 있다. 예를 들어, 사용자가 실행할 수 있는 파일을 찾기 위해서 `-type f -perm -u=x`을 사용한다.

~~~
$ find . -type f -perm -u=x
~~~
{:class="in"}
~~~
./tools/format
./tools/stats
~~~
{:class="out"}

더 진도를 나아가기 전에, `ls -a -l`을 실행해서 평상시에 숨겨져있는 디렉토리 항목을 포함하는 긴 형식 목록 정보를 얻어보자.

~~~
$ ls -a -l
~~~
{:class="in"}
~~~
drwxr-xr-x 1 vlad bio     0  2010-08-14 09:55 .
drwxr-xr-x 1 vlad bio  8192  2010-08-27 23:11 ..
-rw-rw-r-- 1 vlad bio  1158  2010-07-11 08:22 safety.txt
-rwxr-xr-x 1 vlad bio 31988  2010-07-23 20:04 setup
-rw-rw-r-- 1 vlad bio  2312  2010-07-11 08:23 waiver.txt
~~~
{:class="out"}

`.` 과 `..` (현재 디렉토리와 부모 디렉토리)에 대한 권한은 'd'로 시작한다.

The permissions for `.` and `..` (this directory and its parent) start with a 'd'.
But look at the rest of their permissions:
the 'x' means that "execute" is turned on.
What does that mean?
A directory isn't a program&mdash;how can we "run" it?

In fact, 'x' means something different for directories.
It gives someone the right to *traverse* the directory, but not to look at its contents.
The distinction is subtle, so let's have a look at an example.
Vlad's home directory has three subdirectories called `venus`, `mars`, and `pluto`:

<img src="img/x-for-directories.svg" alt="Execute Permission for Directories" />

Each of these has a subdirectory in turn called `notes`,
and those sub-subdirectories contain various files.
If a user's permissions on `venus` are 'r-x',
then if she tries to see the contents of `venus` and `venus/notes` using `ls`,
the computer lets her see both.
If her permissions on `mars` are just 'r--',
then she is allowed to read the contents of both `mars` and `mars/notes`.
But if her permissions on `pluto` are only '--x',
she cannot see what's in the `pluto` directory:
`ls pluto` will tell her she doesn't have permission to view its contents.
If she tries to look in `pluto/notes`, though, the computer will let her do that.
She's allowed to go through `pluto`, but not to look at what's there.
This trick gives people a way to make some of their directories visible to the world as a whole
without opening up everything else.

#### What about Windows?

Those are the basics of permissions on Unix.
As we said at the outset, though, things work differently on Windows.
There, permissions are defined by [access control lists](../../gloss.html#access-control-list),
or ACLs.
An ACL is a list of pairs, each of which combines a "who" with a "what".
For example,
you could give the Mummy permission to append data to a file without giving him permission to read or delete it,
and give Frankenstein permission to delete a file without being able to see what it contains.

This is more flexible that the Unix model,
but it's also more complex to administer and understand on small systems.
(If you have a large computer system,
*nothing* is easy to administer or understand.)
Some modern variants of Unix support ACLs as well as the older read-write-execute permissions,
but hardly anyone uses them.
