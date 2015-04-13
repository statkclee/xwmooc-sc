---
layout: lesson
root: .
title: 용어사전 (Glossary)
---
**<a name="absolute-error">절대 오차 (absolute error)</a>**:
수학적으로 계산한 값과 컴퓨터를 사용하여 유한 근사한 절대값 차이.

**<a name="absolute-path">절대 경로 (absolute path)</a>**:

파일 시스템에 특정 장소를 나타내는 [경로](#path). 절대 경로는 통상 
파일 시스템 [루트 디렉토리](#root-directory)에 대해 작성되고, 
(유닉스)에서는 "/", (마이크로소프트 윈도우)에서는 "\\"으로 시작한다.
[상대 경로 (relative path)](#relative-path) 참조.

**<a name="access-control-list">접근 제어 목록 (access control list, ACL)</a>** :
파일 혹은 디렉토리에 연결되어 누가 무엇을 할 수 있는지를 명시하는  권한 목록.

**<a name="additive-color-model">가색 모델 additive color model)</a>**:
[빨간색, 녹색, 청색 (red, green, and blue)](#rgb) 같은 원색 기여분을 합산하여 색을 표현하는 방법.

**<a name="aggregation-function">집계 함수 (aggregation function)</a>**:
많은 값을 조합하여 하나 결과값을 생성하는 `합계(sum)` 혹은 `최대값(max)` 같은 함수

**<a name="alias-library">(라이브러리의) 별명 (alias)</a>** :
가져오기(import)할 때 [라이브러리 (library)](#library)에 별칭을 부여하는 것.

**<a name="argument">인자 (argument)</a>**:
함수나 프로그램이 실행할 때, 함수나 프로그램에 주어진 값. 이 용어는 종종 [매개변수 (parameter)](#parameter)와 상호호환되어 (그리고 일관성 없이) 사용된다.

**<a name="assertion">가정 대입문 (assertion)</a>**:
프로그램 특정 지점에 참(true)으로 추정되는 표현식.
일반적으로 프로그래머는 오류 확인점검하기 위해서 코드에 가정 대입문을 넣는다.
만약 가정 대입문이 실패하면 (즉, 표현식이 거짓으로 평가되면), 프로그램은 정지하고 오류 메시지를 출력한다.
[불변성 (invariant)](#invariant), [사전조건 (precondition)](#precondition), [사후조건(postcondition)](#postcondition)을 참조한다.

**<a name="assignment">대입 (assignment)</a>**:
변수에 값을 연계함으로써, 값을 이름에 할당하는 것.

**<a name="atomic-value">원자값 (atomic value)</a>**:
더 작은 조각으로 분해될 수 없는 값.
예를 들어, 숫자 12는 일반적으로 원자(atomic) 값으로 볼 수 있다.
(만약 학교 학생에게 덧셈을 가르치지 않는다면, 이 경우에 10과 2로 분해할 수 있다.)

**<a name="branch">브랜치 (branch)</a>**:
[버젼 제어 (version control)](#version-control) [저장소 (repository)](#repository)에 있는 "평행 우주(parallel universe". 일반적으로 프로그래머는 브랜치(branch, 분기)를 사용해서 개발 과정에서 서로에게서 다른 변경사항을 격리한다. 그렇게 함으로써, 한번에 한 문제에 집중할 수 있다. 
[병합 (merge)](#repository-merge) 참조.

**<a name="call-stack">콜 스택 (call stack)</a>**:
실행 프로그램 내부에서 활성 함수 호출을 추적하는 자료 구조.
각 호출 변수는 [스택 프레임 (stack frame)](#stack-frame)에 저장된다;
신규 스택 프레임은 각 호출에 대해서 기존 스택 위에 놓여지고, 호출이 완료될 때 폐기된다.

**<a name="cascading-delete">계단식 삭제 (cascading delete)</a>**:
레코드가 삭제될 때, 데이터베이스에서 그 해당 레코드에 기대고 있는 것을 자동으로 삭제하는 관행.
[참조 무결성 (referential integrity)](#referential-integrity) 참조.

**<a name="case-insensitive">대소문자 구별안함 (case insensitive)</a>**:
대문자와 소문자를 동일한 것처럼 텍스트 문자를 처리.
[대소문자 구별 (case sensitive)](#case-sensitive) 참조.

**<a name="catch-exception">예외처리 (catch an exception)</a>**:
[예외 (exception)](#exception)가 프로그램 어디선가 [발생(raised)](#raise-exception)했을 때 처리.

**<a name="change-set">변경 집합 (change set)</a>**:
하나 혹은 그 이상 파일에 대한 변경 그룹으로 단일 작업으로 [버젼 제어 (version control)](#version-control) [저장소 (repository)](#repository)에 [커밋 (committed)](#commit)된다.

**<a name="repository-clone">클론 (clone)</a>** (a repository):
[버젼 제어 (version control)](#version-control) [저장소 (repository)](#repository)에 로컬 사본을 생성.
[포크 (fork)](#repository-fork) 참조.

**<a name="code-review">코드 리뷰 (code review)</a>**:
소프트웨어 조각 혹은 변경부분에 대한 체계적인 동료 검토.
[저장소(repository)](#repository)에 [병합(merged)](#repository-merge)되기 전에,
동료 검토(peer review)가 통상 [풀 요청(pull requests)](#pull-request) 단계에서 수행된다.

**<a name="csv">콤마 구분값 (comma-separated values, CSV)</a>**:
테이블로 일반적 텍스트를 표현하는데 각 행 값이 콤마로 구분된다.

**<a name="cli">명령-라인 인터페이스 (command-line interface, CLI)</a>** :
일반적으로 [REPL](#repl)로 명령어 타이핑에 기반한 인터페이스.
[그래픽 사용자 인터페이스 (graphical user interface)](#gui) 참조.

**<a name="comment">주석 (comment)</a>**:
프로그램에서 사람이 어떻게 진행되고 있는지에 대한 이해를 주려고 작성된 글로, 컴퓨터는 무시한다.
파이썬, R, 유닉스 쉘은 `#` 문자로 시작해서 라인 끝까지 간다; SQL 주석은 `--`이고, 다른 언어에는 각자의 관습이 있다.

**<a name="conditional-statement">조건문 (conditional statement)</a>**:
프로그램 문장으로 테스트가 참 혹은 거짓에 따라 실행될 수도 실행되지 않을 수 있다.

**<a name="conflict">충돌 (conflict)</a>**:
[버젼제어시스템 (version control system)](#version-control) 한 사용자가 만든 변경사항이
다른 사용자가 만든 변경사항과 양립할 수 없는 상황.
충돌을 [해소(resolve)](#resolve)하도록 사용자를 돕는 것이 버젼 제어의 주요한 작업 중 하나다.

**<a name="cross-product">외적 (cross product)</a>**:
한 집합 모든 요소를 다른 집합 모든 요소와 짝짓는 것. 

**<a name="current-working-directory">현재작업디렉토리 (current working directory)</a>**:
[상대 경로 (relative paths)](#relative-path)로 계산되는 디렉톨; 동일하게,
이름으로만 파일을 참조하여 찾을 수 있는 장소. 
모든 [프로세스(process)](#process)는 현재작업디렉토리를 갖는다.
통상 현재작업디렉토리는 단축 표기 `.` ("닷(dot)"으로 발음) 표기된다.

**<a name="cursor">커서 (cursor)</a>**:
데이터베이스에 작업을 추적하는 포인터.

**<a name="data-type">자료형 (data type)</a>**:
[정수(integer)](#integer) 혹은 [문자열 (character string)](#string) 같은 자료 값 유형.

**<a name="database-manager">데이터베이스 관리자 (database manager)</a>**:
[관계형 데이터베이스(relational database)](#relational-database)를 관리하는 프로그램.

**<a name="default-parameter-value">기본 매개변수값 (default parameter value)</a>**:
명시적으로 어떤 것도 지정되지 않는다면, [매개변수(parameter)](#parameter)에 적용되는 값.

**<a name="defensive-programming">방어적 프로그래밍 (defensive programming)</a>**:
가능하면 빨리 오류를 잡아내도록 연산작업을 점검하는 프로그램을 작성하는 관행.

**<a name="delimiter">구분자 (delimiter)</a>**:
[CSV](#csv) 파일에 칼럼 사이 콤마처럼 각 값을 구분하는데 사용되는 문자(들).

**<a name="docstring">docstring</a>**:
"문서화 문자열(documentation string)"의 축약형.
파이썬 프로그램에 내장된 텍스트 문서를 지칭한다.
주석과 달리, docstring은 실행 프로그램에 상주하며 인터랙티브 세션에서 조사할 수 있다.

**<a name="documentation">문서화 (documentation)</a>**:
사람 언어로 텍스트로 작성되어 소프트웨어가 무엇을 수행하며, 어떻게 동작하고, 어떻게 사용하는지 기술한다.

**<a name="dotted-notation">점표기법 (dotted notation)</a>**:
많은 프로그램 언어에 사용되는 2분 표기법(two-part notation).
`thing.component`에서 `component`가 `thing`에 속하는 것을 나타낸다.

**<a name="empty-string">빈 문자열 (empty string)</a>**:
어떤 문자도 포함하지 않아서, 종종 "제로(zero)" 텍스트로 간주되는 문자열.

**<a name="encapsulation">캡슐화 (encapsulation)</a>**:
어떤 것의 구현 상세 세부내용을 숨기는 관례.
그렇게 함으로써, 프로그램이 *방법(how)*보다 *무엇(what)*에 집중할 수 있다.

**<a name="exception">예외 (exception)</a>**:
정상 혹은 예상 프로그램 실행을 파괴하는 이벤트.
대부분 최신 언어는 데이터 일부에서 오동작(또한 예외로 불림)하는 것에 대한 정보를 기록한다.  
[예외처리 (catch)](#catch-exception), [예외발생 (raise)](#raise-exception).

**<a name="field-database">(데이터베이스) 필드(field)</a>**:
[테이블(table)](#table-database)에 각 [레코드(record)](#record-database)마다, 특정 자료형을 갖는 데이터 값 집합.

**<a name="filename-extension">파일 확장자 (filename extension)</a>**:
마지막 "." 문자 뒤에 오는 파일이름 부분.
관례로, 이것을 사용해서 파일 형식을 식별한다; `.txt`는 "텍스트 파일",
`.png`는 "휴대용 네트워크 그래픽 파일 (Portable Network Graphics file)" 등등 의미한다.
이러한 관례가 대부분의 운영체제에서 강제되지는 않는다:
MP3 소리 파일을 `homepage.html`로 이름을 부여하는 것도 가능하다.
많은 응용프로그램이 파일 확장자를 사용해서 파일 [마임 형태(MIME type)](#mime-type)을 식별하기 때문에,
파일 확장자를 잘못 명명하게 되면 응용프로그램이 중단되어 실패할 수도 있다.

**<a name="filesystem">파일시스템 (filesystem)</a>**:
파일, 디렉토리, 입출력 장치 (키보드, 모니터 화면) 집합.
파일시스템이 물리적 장치에 여기저기 흩어지거나 많은 파일시스템이 단일 물리 장치에 저장될 수도 있다; [운영체제(operating system)](#operating-system)가 접근을 관리한다.

**<a name="filter">필터 (filter)</a>**:
자료 흐름을 변환하는 프로그램. 
많은 유닉스 명령어-라인 도구는 필터로 작성된다: 
[표준입력 (standard input)](#standard-input)에서 데이터를 읽고, 처리하고, 결과를 
[표준출력 (standard output)](#standard-output)에 쓴다.

**<a name="command-line-flag">플래그 (flag)</a>**:
옵션을 명시하거나 명령어-라인 프로그램 설정하는 간결한 방법. 관례로, 
유닉스 응용프로그램은 `-v`처럼 대쉬 다음에 문자 하나를 혹은 `--verbose`처럼 대쉬 2개 다음에 단어를 사용한다. 반면에 도스 응용프로그램은 `/V`처럼 슬래귀(slash)를 사용한다.
응용프로그램에 따라, 플래그를 `-o /tmp/output.txt`와 같이 단일 인자 앞에 둘 수 있다.

**<a name="float">부동소수점 수 (floating point number)</a>**:
소수 부분과 지수 부분을 담고 있는 숫자.
[정수(integer)](#integer) 참고.

**<a name="for-loop"> for 루프 (for loop)</a>**:
집합, 리스트 혹은 범위에 속한 각 값에 대해 한번씩 실행되는 루프.
[while 루프 (while loop)](#while-loop) 참고.

**<a name="foreign-key">외래키 (foreign key)</a>**:
또다른 테이블에 있는 [레코드 (records)](#record-database)를 식별하는데 사용되는
[데이터베이스 테이블 (database table)](#table-database)에 있는 하나 혹은 그 이상의 값.

**<a name="repository-fork">포크 (fork)</a>**:
서버에 [버젼제어 (version control)](#version-control) [저장소 (repository)](#repository)를 [복제(clone)](#repository-clone)하는 것.

**<a name="function-body">함수 몸통 (function body)</a>**:
함수 내부 실행되는 문장.

**<a name="function-call">함수 호출 (function call)</a>**:
또 다른 소프트웨어 부분에서 함수를 사용.

**<a name="function-composition">함수 합성 (function composition)</a>**:
`f(g(x))` 처럼, 함수 결과를 즉시 다른 함수에 적용.

**<a name="gui">그래픽 사용자 인터페이스 (graphical user interface, GUI)</a>** :
통상 마우스를 사용해서 제어되는 그래픽 사용자 인터페이스.
[명령-라인 인터페이스 (command-line interface)](#cli) 참조.

**<a name="home-directory">홈 디렉토리 (home directory)</a>**:
컴퓨터 시스템 계정과 연관된 기본 디렉토리.
관례로, 사용자 파일 모두가 홈 데렉토리 혹은 하위 디렉토리에 저장된다.

**<a name="http">HTTP</a>**:
웹페이지와 월드와이드웹 상에 다른 데이터를 공유하는데 사용되는 하이퍼텍스트 전송 [프로토콜(Protocol)](#protocol).

**<a name="immutable">불변(immutable)</a>**:
변경할 수 없는 것.
불변 데이터 값은 생성되면 변경할 수 없다.
[변경가능 (mutable)](#mutable) 참조.

**<a name="import">가져오기 (import)</a>**:
[라이브러리(library)](#library)를 프로그램에 적재.

**<a name="in-place-operator">제자리 연산 (in-place operator)</a>**:
`+=`같은 연산자로 대입되는 변수가 대입 오른편에 피연산자가 되는 흔한 경우에 제공되는 짧은 표기법.
예를 들어, `x += 3` 문장은 `x = x + 3`와 동일한 의미다.

**<a name="index">인덱스 (index)</a>**:
이미지에 픽셀 하나처럼, 컬렉션(collection)에 단일 값 위치를 지정하는 첨자.

**<a name="infective-license">전염성있는 라이센스 (infective license)</a>**:
[GPL](http://opensource.org/licenses/GPL-3.0)같은 라이센스로 자신의 작업물에 저작물을 적용한 사람도 동일한 공유 요건을 두게 만드는 라이센스.

**<a name="inner-loop">내부 루프 (inner loop)</a>**:
또다른 루프 내부에 있는 루프.
[외부 루프 (outer loop)](#outer-loop) 참조.

**<a name="integer">정수 (integer)</a>**:
-12343같은 정수(whole number).
[부동소수점 수 (floating-point number)](#float) 참조.

**<a name="invariant">불변 (invariant)</a>**:
일반적으로 [가정 대입문(assertion)](#assertion)에 사용되며, 
프로그램 실행 동안에 값이 변경되지 않는 표현식.
[사전조건 (precondition)](#precondition), [사후조건 (postcondition)](#postcondition) 참조.

**<a name="library">라이브러리 (library)</a>**:
관련된 작업 집합을 구현하는 (함수, 클래스, 변수) 코드 조직단위.

**<a name="loop-body">루프 몸통 (loop body)</a>**:
[for 루프 (for loop)](#for-loop) 혹은 [while 루프 (while loop)](#while-loop) 내부에서
반복되는 문장 혹은 명령어 집합.

**<a name="loop-variable">루프 변수 (loop variable)</a>**:
루프 진도를 추적하는 변수.

**<a name="macro">매크로 (macro)</a>**:
[Makefiles](#makefile)에서 [변수(variables)](#variable)가 종종 매크로 불린다. 
왜냐하면 읽어들여졌을 때 확장되기 때문이다.

**<a name="makefile">makefile</a>**:
`make` 프로그램에 입력 파일. `make`에 무엇을 수행할지 지시한다.

**<a name="member">멤버 (member)</a>**:
[객체(object)](#object) 내부에 포함된 변수.

**<a name="repository-merge">(저장소) 병합(merge)</a>** :
[저장소 (repository)](#repository)에 두 변경 집합을 일치시킨다.

**<a name="method">메쏘드 (method)</a>**:
특정 [객체(object)](#object)에 묶인 함수. 
각 객체 메쏘드는 객체가 할 수 있는 것 중 하나 혹은 답할 수 있는 질문 중 하나를 구현한다.

**<a name="mutable">변경가능 (mutable)</a>**:
변경할 수 있는 것.
변경할 수 있는 데이터 값은 제자리에서 변경될 수 있다.
[불변(immutable)](#immutable) 참조.

**<a name="notional-machine">관념기계 (notional machine)</a>**:
컴퓨터가 무엇을 할 수 있고, 무엇을 할 것인지에 대해 생각하는데 사용되는 추상 컴퓨터.

**<a name="orthogonal">직교 (orthogonal)</a>**:
서로 다른 것과 독립적인 행동과 의미를 갖는 것.
만약 개념 혹은 도구 집합이 직교라면, 어떤 방식으로든지 조합될 수 있다.

**<a name="outer-loop">외부 루프 (outer loop)</a>**:
또다른 루프를 포함하는 루프.
[내부 루프 (inner loop)](#inner-loop) 참조.

**<a name="parameter">매개변수 (parameter)</a>**:
함수 선언에 명명되는 변수로 함수 호출에 전달되는 값을 보관하는데 사용된다.
이 용어는 종종 [인자(argument)](#argument)와 상호호환되어 (그리고 일관성 없이) 사용된다.

**<a name="parent-directory">부모 디렉토리 (parent directory)</a>**:
해당 디렉토리를 "담고있는" 디렉토리.
모든 디렉토리는 [루트 디렉토리 (root directory)](#root-directory)를 제외하고 부모가 있다.
디렉토리 부모는 통상 `..` ("닷닷(dot dot)"으로 발음)를 사용해서 표기한다. 

**<a name="phony-target">가짜 목표 (phony target)</a>**: 
[Makefile](#makefile) [규칙(rule)](#make-rule) 내부 형식으로 
생성될 필요가 있는 실제 파일과 상응하지는 않지만, 대신에 [의존성(dependencies)](#dependencies) 실행을 확실히 하는데 사용되는 플레이스홀더(placeholder)역할을 수행.

**<a name="pipe">파이프 (pipe)</a>**:
한 프로그램 출력이 다른 프로그램 입력으로 연결.
두개 혹은 그 이상의 프로그램이 이런 방식으로 연결될 때, "파이프라인(pipeline)"으로 불린다.

**<a name="pipe-and-filter">파이프와 필터 (pipe and filter)</a>**:
프로그래밍 모형으로 데이터 [스트림(streams)](#stream)을 처리하는 [필터(filters)](#filter)가
끝과 끝을 붙여 연결된다. 파이프와 필터 모형은 유닉스 [쉘(shell)](#shell)에서 폭넓게 사용된다.

**<a name="postcondition">사후조건 (postcondition)</a>**:
함수가 실행을 종료하자마자 함수(혹은 다른 코드 블록)가 보장하는 조건이 참(true)이다.
사후조건은 종종 [가정대입문(assertions)](#assertion)으로 표현된다.

**<a name="precondition">사전조건 (precondition)</a>**:
함수 (혹은 다른 코드 블록)가 올바르게 실행되기 위해 참(true)인 조건.

**<a name="prepared-statement">prepared statement</a>**:
[SQL](#sql) 쿼리 템플릿으로 그곳에 값이 채워질 수 있다.

**<a name="primary-key">primary key</a>**:
One or more [fields](#field-database) in a [database table](#table-database)
whose values are guaranteed to be unique for each [record](#record-database),
i.e.,
whose values uniquely identify the entry.

**<a name="process">process</a>**:
A running instance of a program,
containing code,
variable values,
open files and network connections,
and so on.
Processes are the "actors" that the [operating system](#operating-system) manages;
it typically runs each process for a few milliseconds at a time
to give the impression that they are executing simultaneously.

**<a name="prompt">prompt</a>**:
A character or characters display by a [REPL](#repl) to show that
it is waiting for its next command.

**<a name="protocol">protocol</a>**:
A set of rules that define how one computer communicates with another.
Common protocols on the Internet include [HTTP](#http) and [SSH](#ssh).

**<a name="pull-request">pull request</a>**:
A set of changes created in one [version control](#version-control) [repository](#repository)
that is being offered to another for [merging](#repository-merge).

**<a name="query">query</a>**:
A database operation that reads values but does not modify anything.
Queries are expressed in a special-purpose language called [SQL](#sql).

**<a name="shell-quoting">quoting</a>** (in the shell):
Using quotation marks of various kinds to prevent the shell from interpreting special characters.
For example,
to pass the string `*.txt` to a program,
it is usually necessary to write it as `'*.txt'` (with single quotes)
so that the shell will not try to expand the `*` wildcard.

**<a name="raise-exception">raise</a>** (an exception):
To explicitly signal that an [exception](#exception) has occured in a program.
See also: [catch](#catch-exception).

**<a name="repl">read-eval-print loop</a>** (REPL):
A [command-line interface](#cli) that reads a command from the user,
executes it,
prints the result,
and waits for another command.

**<a name="record-database">record</a>** (in a database):
A set of related values making up a single entry in a [database table](#table-database),
typically shown as a row.
See also: [field](#field-database).

**<a name="redirect">redirect</a>**:
To send a command's output to a file rather than to the screen or another command,
or equivalently to read a command's input from a file.

**<a name="referential-integrity">referential integrity</a>**:
The internal consistency of values in a database.
If an entry in one table contains a [foreign key](#foreign-key),
but the corresponding [records](#record-database) don't exist,
referential integrity has been violated.

**<a name="regression">regression</a>**:
To re-introduce a bug that was once fixed.

**<a name="regular-expression">regular expressions</a>** (RE):
A pattern that specifies a set of character strings.
REs are most often used to find sequences of characters in strings.

**<a name="relational-database">relational database</a>**:
A collection of data organized into [tables](#table-database).

**<a name="relative-error">relative error</a>**:
The ratio of the [absolute error](#absolute-error) in an approximation of a value
to the value being approximated.

**<a name="relative-path">relative path</a>**:
A [path](#path) that specifies the location of a file or directory
with respect to the [current working directory](#current-working-directory).
Any path that does not begin with a separator character ("/" or "\\") is a relative path.
See also: [absolute path](#absolute-path).

**<a name="remote-login">remote login</a>**:
To connect to a computer over a network,
e.g., to run a [shell](#shell) on it.
See also: [SSH](#ssh).

**<a name="repository-remote">remote repository</a>**:
A version control [repository](#repository) other than the current one
that the current one is somehow connected to or mirroring.

**<a name="repository">repository</a>**:
A storage area where a [version control](#version-control) system
stores old [revisions](#revision) of files
and information about who changed what, when.

**<a name="resolve">resolve</a>**:
To eliminate the [conflicts](#conflict) between two or more incompatible changes to a file or set of files
being managed by a [version control](#version-control) system.

**<a name="return-statement">return statement</a>**:
A statement that causes a function to stop executing and return a value to its caller immediately.

**<a name="revision">revision</a>**:
A recorded state of a [version control](#version-control) [repository](#repository).

**<a name="rgb">RGB</a>** (red-green-blue):
An [additive model](#additive-color-model)
that represents colors as combinations of red, green, and blue.
Each color's value is typically in the range 0..255
(i.e., a one-byte integer).

**<a name="root-directory">root directory</a>**:
The top-most directory in a [filesystem](#filesystem).
Its name is "/" on Unix (including Linux and Mac OS X) and "\\" on Microsoft Windows.

**<a name="search-path">search path</a>**:
The list of directories in which the [shell](#shell) searches for programs when they are run.

**<a name="sentinel-value">sentinel value</a>**:
A value in a collection that has a special meaning,
such as 999 to mean "age unknown".

**<a name="shape">shape</a>** (of an array):
An array's dimensions, represented as a vector.
For example, a 5&times;3 array's shape is `(5,3)`.

**<a name="shell">shell</a>**:
A [command-line interface](#cli)
such as Bash (the Bourne-Again Shell)
or the Microsoft Windows DOS shell
that allows a user to interact with the [operating system](#operating-system).

**<a name="shell-script">shell script</a>**:
A set of [shell](#shell) commands stored in a file for re-use.
A shell script is a program executed by the shell;
the name "script" is used for historical reasons.

**<a name="sign-and-magnitude">sign and magnitude</a>**:
A scheme for representing numbers in which one bit indicates the sign (positive or negative)
and the other bits store the number's absolute value.
See also: [two's complement](#twos-complement).

**<a name="silent-failure">silent failure</a>**:
Failing without producing any warning messages.
Silent failures are hard to detect and debug.

**<a name="slice">slice</a>**:
A regular subsequence of a larger sequence,
such as the first five elements or every second element.

**<a name="sql">SQL</a>** (Structured Query Language):
A special-purpose language for describing operations on [relational databases](#relational-database).

**<a name="sql-injection-attack">SQL injection attack</a>**:
An attack on a program in which the user's input contains malicious SQL statements.
If this text is copied directly into an SQL statement,
it will be executed in the database.

**<a name="ssh">SSH</a>**:
The Secure Shell [protocol](#protocol) used for secure communication between computers.
SSH is often used for [remote login](#remote-login) between computers.

**<a name="ssh-key">SSH key</a>**:
A digital key that identifies one computer or user to another.

**<a name="stack-frame">stack frame</a>**:
A data structure that provides storage for a function's local variables.
Each time a function is called,
a new stack frame is created
and put on the top of the [call stack](#call-stack).
When the function returns,
the stack frame is discarded.

**<a name="standard-input">standard input</a>** (stdin):
A process's default input stream.
In interactive command-line applications,
it is typically connected to the keyboard;;
in a [pipe](#pipe),
it receives data from the [standard output](#standard-output) of the preceding process.

**<a name="standard-output">standard output</a>** (stdout):
A process's default output stream.
In interactive command-line applications,
data sent to standard output is displayed on the screen;
in a [pipe](#pipe),
it is passed to the [standard input](#standard-input) of the next process.

**<a name="stride">stride</a>**:
The offset between successive elements of a [slice](#slice).

**<a name="string">string</a>**:
Short for "character string",
a [sequence](#sequence) of zero or more characters.

**<a name="sub-directory">sub-directory</a>**:
A directory contained within another directory.

**<a name="tab-completion">tab completion</a>**:
A feature provided by many interactive systems in which
pressing the Tab key triggers automatic completion of the current word or command.

**<a name="table-database">table</a>** (in a database):
A set of data in a [relational database](#relational-database)
organized into a set of [records](#record-database),
each having the same named [fields](#field-database).

**<a name="test-oracle">test oracle</a>**:
A program, device, data set, or human being
against which the results of a test can be compared.

**<a name="test-driven-development">test-driven development</a>** (TDD):
The practice of writing unit tests *before* writing the code they test.

**<a name="timestamp">timestamp</a>**:
A record of when a particular event occurred.

**<a name="tuple">tuple</a>**:
An [immutable](#immutable) [sequence](#sequence) of values.

**<a name="twos-complement">two's complement</a>**:
A scheme for representing numbers which wraps around like an odometer
so that 111...111 represents -1.
See also: [sign and magnitude](#sign-and-magnitude).

**<a name="user-group">user group</a>**:
A set of users on a computer system.

**<a name="user-group-id">user group ID</a>**:
A numerical ID that specifies a [user group](#user-group).

**<a name="user-group-name">user group name</a>**:
A textual name for a [user group](#user-group).

**<a name="user-id">user ID</a>**:
A numerical ID that specifies an individual user on a computer system.
See also: [user name](#user-name).

**<a name="user-name">user name</a>**:
A textual name for a user on a computer system.
See also: [user ID](#user-id).

**<a name="variable">variable</a>**:
A name in a program that is associated with a value or a collection of values.

**<a name="version-control">version control</a>**:
A tool for managing changes to a set of files.
Each set of changes creates a new [revision](#revision) of the files;
the version control system allows users to recover old revisions reliably,
and helps manage conflicting changes made by different users.

**<a name="while-loop">while loop</a>**:
A loop that keeps executing as long as some condition is true.
See also: [for loop](#for-loop).

**<a name="wildcard">wildcard</a>**:
A character used in pattern matching.
In the Unix shell,
the wildcard "*" matches zero or more characters,
so that `*.txt` matches all files whose names end in `.txt`.
