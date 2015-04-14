---
layout: lesson
root: ../..
title: 쉘 참고 정보 (Shell Reference)
---

#### 기본 명령어

*   `cat` 입력 정보의 콘텐츠 내용을 화면에 출력한다.
*   `cd path` 현재 작업 디렉토리를 변경한다.
*   `cp old new` 파일을 복사한다.
*   `find` 특정 속성을 갖는 파일을 패턴 매칭을 통해 찾는다.
*   `grep` 파일에서 패턴 매칭하는 라인을 선택한다.
*   `head` 입력 파일의 첫 몇 라인을 화면에 출력한다.
*   `ls path` 특정 파일 혹은 디렉토리 목록을 출력한다; `ls` 자체는 현재 작업 디렉토리를 목록을 출력한다.
*   `man command` 주어진 명령어(command)에 대한 도움말(manual) 페이지를 화면에 출력한다.
*   `mkdir path` 신규 디렉토리를 생성한다.
*   `mv old new` 파일 혹은 디렉토리를 이동(move)하거나, 이름을 변경(rename)한다.
*   `pwd` 사용자의 현재 작업 디렉토리를 출력한다.
*   `rm path` 파일을 제거(remove)하거나 삭제(delete)한다.
*   `rmdir path` 파일이 없는 빈 디렉토리를 제거(remove)하거나 삭제(delete)한다.
*   `sort` 입력을 정렬한다.
*   `tail` 입력 파일의 마지막 몇 라인을 화면에 출력한다.
*   `touch path` 만약 아직 존재하지 않는다면 빈 파일을 생성한다.
*   `wc` 입력 파일 라인, 단어수, 문자수를 계수한다.
*   `whoami` 사용자 현재 신원을 보여준다.

#### 경로 (Paths)

*   `/path/from/root` 은 절대경로(absolute path)다.
*   `/` 은 파일시스템의 루트 디렉토리를 나타낸다.
*   `path/without/leading/slash` 은 상대경로(relative path)다.
*   `.`은 현재 디렉토리를 나타낸다, `..`은 현재 디렉토리의 부모 디렉토리를 나태낸다.
*   `*`은 파일명 0 혹은 그이상 문자를 매칭한다. 그래서 `*.txt`은 `.txt`으로 끝나는 모든 파일을 매칭한다.
*   `?`은 파일명 임의 단일 문자만 매칭한다. 그래서 `?.txt`은 `a.txt`은 매칭하지만, `any.txt`은 매칭하지 않는다.

#### 명령어 조합하기 (Combining Commands)

*   `command > file`은 명령 출력을 파일로 되돌리기(redirect)한다.
*   `first | second`은 첫번째 명령 출력을 두번째 입력으로 연결한다.
*   `for`루프는 리스트에 있는 모든 항목을 한번씩 반복하는 명령어다.

        for variable in name_1 name_2 name_3
        do
            ...commands refering to $variable...
        done

*   `$name`을 사용해서 변수를 확장한다. (즉, 그 값을 얻는다.)
*   `history`는 최신 명령어를 출력하고, `!number`는 해당 숫자(number) 명령어를 반복한다.
*   `bash filename`는 `filename`에 저장된 명령어를 실행한다.
*   `$*`은 모든 쉘 스크립트 명령-라인 매개변수를 나타낸다.
*   `$1`, `$2`, 등등., 은 특정 명령-라인 매개변수를 나타낸다.
*   `$(command)`은 명령 출력결과를 해당 자리(in place)에 삽입한다.
