---
layout: lesson
root: ../..
title: 깃 참고 정보 (Git Reference)
---

전역 환경설정 (컴퓨터마다 한번만 필요)

~~~
git config --global user.name "Your Name"
git config --global user.email "you@some.domain"
git config --global color.ui "auto"
git config --global core.editor "your_editor"
~~~

저장소로 현재 작업 디렉토리를 초기화한다:

~~~
git init
~~~

저장소 상태를 화면에 출력한다:

~~~
git status
~~~

집결 영역(staging area)에 특정 파일 추가한다:

~~~
git add filename_1 filename_2
~~~

집결 영역(staging area)에 현재 디렉토리와 그 하위 디렉토리 변경된 모든 파일을 추가한다:

~~~
git add -A .
~~~

집결 영역 변경사항을 저장소 이력으로 커밋(commit)한다:
(`-m`과 메시지가 없으면, 해당 명령어는 텍스트 편집기를 실행한다.)

~~~
git commit -m "Some message"
~~~

저장소 이력을 살펴본다:

~~~
git log
~~~

저장소 현재 상태와 저장된 가장 최근 상태 사이 차이분을 화면에 출력한다:

~~~
git diff
~~~

특정 파일의 현재 상태와 저장된 가장 최신 상태 사이 차이분을 화면에 출력한다:

~~~
git diff path/to/file
~~~

저장된 가장 최신 상태와 집결 영역(staging area) 사이 차이분을 화면에 출력한다:

~~~
git diff --staged
~~~

특정 파일과 이전에 저장된 상태를 비교한다:

~~~
git diff HEAD~1 path/to/file
~~~

파일과 훨씬 이전에 저장된 상태를 비교한다:

~~~
git diff HEAD~27 path/to/file
~~~

파일과 특정 이전 상태를 비교한다:

~~~
git diff 123456 path/to/file
~~~

마지막 저장된 상태이래로 변경사항을 제거한다ㅣ:

~~~
git reset --hard HEAD
~~~

파일을 이전 수정 상태로 되돌린다:

~~~
git checkout 123456 path/to/file
~~~

원격(remote) 저장소를 추가한다:

~~~
git remote add nickname remote_specification
~~~

원격 저장소를 화면에 출력한다:

~~~
git remote -v
~~~

로컬 저장소 원격 저장로 변경 사항을 푸쉬(push)한다. (원격 저장소에 `master`가 이미 존재한다고 가정):

~~~
git push nickname master
~~~

로컬 저장소에서 원격 저장소로 변경 사항을 푸쉬(push)한다. (원격 저장소에 `master`가 존재하지 않는다면)

~~~
git push -u nickname master
~~~

원격 저장소에서 변경 사항을 풀(pull)한다:

~~~
git pull nickname master
~~~

주의: `master`가 좀더 고급 사용자에 의해서 또다른 브랜치로 교체될 수도 있다.

원격 저장소를 복제(clone)한다:

~~~
git clone remote_specification
~~~

병합(merge)하는 동안에 파일에 충돌(conflict)를 보여주는데 표식자(`<`, `>`)가 사용된다:

~~~
<<<<<<< HEAD
lines from local file
=======
lines from remote file
>>>>>>> 1234567890abcdef1234567890abcdef12345678
~~~
