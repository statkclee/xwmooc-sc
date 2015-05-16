---
layout: lesson
root: ../..
title: 파일이름 확장 (Filename Expansion)
level: intermediate
---
<div class="objectives" markdown="1">
#### 학습목표
*   FIXME
</div>

접두어 "original-"을 붙여 파일명을 바꿨기 때문에,
꺼꾸로 뒤집어, 접두어를 제거하자.
예를 들어, `${filename}`처럼 중괄호 내부에 변수를 두어,
새로운 힘을 얻게된다 &mdash; 변수값을 추출할 때 변수값을 변경할 능력이 사례가 된다.

<div class="in" markdown="1">
~~~
for filename in *.dat
do
    echo mv $filename ${filename#original-}
done
~~~
</div>

`#` 표기법은 시작 변수값에서 해당 텍스트를 제거한다.
그래서, 상기 루프는 다음을 출력한다.


<div class="out" markdown="1">
~~~
mv original-basilisk.dat basilisk.dat
mv original-unicorn.dat unicorn.dat
~~~
</div>

`#` 대신에 `%`을 사용하게 되면 끝에서부터 텍스트를 제거한다.

<div class="in" markdown="1">
~~~
for filename in *.dat
do
    echo mv $filename ${filename%.dat}
done
~~~
</div>

상기 루프 실행결과는 다음과 같다.

<div class="out" markdown="1">
~~~
mv original-basilisk.dat original-basilisk
mv original-unicorn.dat original-unicorn
~~~
</div>

> #### 변수명과 텍스트를 혼동하는 위험 회피하기
> 
> 종종, 뭔가 변수끝에 추가하고 싶을지도 모른다.
> 예를 들어, 파일명 끝에 "backup"을 추가하고 싶을지 모른다.
> 
> ~~~
> for filename in *.dat
> do
>     echo mv $filenamebackup
> done
> ~~~
> 
> 이럴수가 : 매번 루프가 반복될 때마다, 쉘이 `filenamebackup` 변수명을 찾는데, 존재하지 않는다. 
> "backup" 텍스트를 갖는 `$filename` 변수와 혼동되는 것을 회피하기 위해서
> 중괄호를 사용한다.
>
> ~~~
> for filename in *.dat
> do
>     echo mv $filename ${filename}backup
> done
> ~~~
>
> 상기 명령어는 다음을 화면에 출력한다.
>
> ~~~
> mv original-basilisk.dat original-basilisk.datbackup
> mv original-unicorn.dat original-unicorn.datbackup
> ~~~

<div class="keypoints" markdown="1">
#### Key Points
*   FIXME
</div>
