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

**<a name="primary-key">기본키(primary key)</a>**:
[데이터베이스 테이블(database table)](#table-database)에 있는 하나 혹은 그 이상의 [필드(fields)](#field-database)로
그 값이 각 [레코드(record)](#record-database)에 유일하다(유니크, unique)고 보장된 것.
즉, 해당 값이 유일하게 항목을 식별한다.

**<a name="process">프로세스 (process)</a>**:
프로그램 실행 인스턴스로 코드, 변수 값, 파일, 네트워크 연결 정보 등등을 담고 있다.
프로세스는 [운영체제(operating system)](#operating-system)가 관리하는 "배우(actor)"다;
통상, 운영체제는 각 프로세스를 한번에 수백분의 몇초 동안 실행해서 운영체제가 여러 프로세스를 동시 실행하고 있다는 인상을 준다.

**<a name="prompt">프롬프트 (prompt)</a>**:
컴퓨터가 다음 명령을 대기하고 있다는 것을 보여주기 위해서 [REPL](#repl)에 의한 한 문자 혹은 여러 문자 출력.

**<a name="protocol">프로토콜 (protocol)</a>**:
한 컴퓨터가 다른 컴퓨터와 어떻게 의사소통하지는 정의하는 규칙 집합.
인터넷 공통 프로토콜에 [HTTP](#http)와 [SSH](#ssh)이 포함된다.

**<a name="pull-request">풀요청 (pull request)</a>**:
[버젼제어(version control)](#version-control) [저장소(repository)](#repository)에 생성된 변경 사항으로
[병합(merging)](#repository-merge)을 위해 다른 곳에 제공된다.

**<a name="query">쿼리 (query)</a>**:
값을 읽어 들이지만, 어떤 것도 변경하지 않는 데이터베이스 연산.
쿼리는 [SQL](#sql)로 불리는 특수 목적 언어로 표현된다.

**<a name="shell-quoting">(쉘에서) 인용 (quoting)</a>**:
쉘이 특수 문자를 해석하지 못하게 다양한 종류의 인용부호를 사용하는 것.
예를 들어, 프로그램에 `*.txt` 문자열을 전달하기 위해서, (단일 인용부호)로 `'*.txt'`와 같이 일반적으로 작성하는 것이 필요하다.
그렇게 함으로써 쉘이 와일드카드 문자 `*`를 확장하지 않는다.

**<a name="raise-exception">(예외) 발생 (raise)</a>**:
프로그램에 [예외(exception)](#exception)가 발생했다는 신호를 명시적으로 준다.  
[(예외) 처리(catch)](#catch-exception) 참조.

**<a name="repl">읽기-평가-출력 루프 (read-eval-print loop, REPL)</a>**:
[명령-라인 인터페이스 (command-line interface, CLI)](#cli)로 사용자로부터 명령을 읽고, 실행하고, 결과를 출력하고 다음 명령을 대기한다.

**<a name="record-database">(데이터베이스에서) 레코드 (record)</a>**:
[데이터베이스 테이블 (database table)](#table-database)에서 단일 항목을 구성하는 관련된 값 집합.
통상 행(row)으로 표현됨.  
[필드(field)](#field-database) 참조.

**<a name="redirect">리다이렉트(redirect)</a>**:
화면이나 다른 명령에 보내기보다 파일에 명령 출력 결과를 전송함.
혹은 동등하게 파일로부터 명령 입력값을 읽는 것.

**<a name="referential-integrity">참조무결성 (referential integrity)</a>**:
데이터베이스에 값에 대한 내부 일치성.
만약 한 테이블에 항목이 [외래키(foreign key)](#foreign-key)를 갖고 있지만 
상응하는 [레코드(records)](#record-database)가 존재하지 않는다면,
참조무결성이 위반된 것이다.

**<a name="regression">회귀(regression)</a>**:
일전에 수정한 버그가 다시 생겨난 것.

**<a name="regular-expression">정규표현식 (regular expressions, RE)</a>**:
문자열 집합을 명시하는 패턴.
문자열에서 문자 시퀀스(sequence)를 찾는데 RE가 가장 자주 사용된다.

**<a name="relational-database">관계형 데이터베이스 (relational database)</a>**:
[테이블(tables)](#table-database)로 조직화되는 데이터 집합.

**<a name="relative-error">상대오차 (relative error)</a>**:
[절대오차 (absolute error)](#absolute-error) 비율로 근사값으로 실제값을 근사한다.

**<a name="relative-path">상대경로(relative path)</a>**:
[현재작업디렉토리 (current working directory)](#current-working-directory)에 대해서 
파일 혹은 디렉토리 위치를 명시하는 [경로(path)](#path).
구분 문자 (유닉스 "/" 혹은 윈도우"\\")로 시작하지 않는 모든 경로는 상대경로다.  
[절대경로 (absolute path)](#absolute-path) 참조.

**<a name="remote-login">원격 로그인 (remote login)</a>**:
네트워크로 컴퓨터에 연결.
즉, 네트워크로 [쉘(shell)](#shell)을 실행.  
[SSH](#ssh) 참조.

**<a name="repository-remote">원격 저장소 (remote repository)</a>**:
현재 저장소가 아닌 버젼 제어 [저장소(repository)](#repository)로
현재 저장소가 무언가로 연결되거나 미러링(mirroring)된 것.

**<a name="repository">저장소 (repository)</a>**:
저장 영역으로 [버젼제어(version control)](#version-control) 시스템이 누가 언제 무엇을 변경했는지에 대한
[수정(revisions)](#revision)된 과거 파일과 정보를 저장한다.

**<a name="resolve">해소하다 (resolve)</a>**:
만약 [버젼제어(version control)](#version-control) 시스템에서 관리되는 
파일 한개 혹은 파일 집합에 둘 혹은 그 이상 양립할 수 없는 변경사항이 있다면 [충돌(conflicts)](#conflict)을 제거하는 것.

**<a name="return-statement">반환문장 (return statement)</a>**:
함수가 실행을 멈추고, 값을 즉시 호출자(caller)에 반환하는 문장.

**<a name="revision">수정(revision)</a>**:
[버젼제어(version control)](#version-control) [저장소(repository)](#repository)에 기록된 상태.

**<a name="rgb">RGB(빨간색-녹색-파란색, red-green-blue)</a>** :
[가색모형(additive model)](#additive-color-model)으로 색을 빨간색, 녹색, 파란색을 조합해서 표현.
각 색깔 값 범위는 일반적으로 0..255 (즉, 1 바이트 정수).

**<a name="root-directory">루트 디렉토리 (root directory)</a>**:
[파일시스템(filesystem)](#filesystem)에서 최상단 디렉토리.
루트 디렉토리 이름은 유닉스(리눅스 및 맥OS 포함)에서 "/"이고,
마이크로소프트 윈도우에서는 "\\"이 된다.

**<a name="search-path">검색 경로(search path)</a>**:
프로그램이 실행될 때, [쉘(shell)](#shell)이 프로그램을 검색하는 디렉토리 목록.

**<a name="sentinel-value">보초값 (sentinel value)</a>**:
컬렉션(collection)에서 특별한 의미를 갖는 값.
예를 들어, 999가 "연령 미상"을 의미.

**<a name="shape">(배열) 형상(shape)</a>**:
배열의 차원으로 벡터로 표현.
예를 들어, 5&times;3 배열 형상(array's shape)은 `(5,3)`이다.

**<a name="shell">쉘(shell)</a>**:
Bash (the Bourne-Again Shell)나 마이크로소프트 윈도우 도스 쉘처럼 
[명령-라인 인터페이스(command-line interface, CLI)](#cli)로
사용자가 [운영체제(operating system)](#operating-system)와 상호작용할 수 있게 한다.

**<a name="shell-script">쉘 스크립트(shell script)</a>**:
재사용을 위해서 파일에 저장된 [쉘(shell)](#shell) 명령어 집합.
쉘 스크립트는 쉘이 실행하는 프로그램이다; "스크립트(script)"라는 이름은 역사적인 연유로 인해서 사용된다.

**<a name="sign-and-magnitude">부호와 크기(sign and magnitude)</a>**:
숫자를 표현하는 기법(scheme)으로 비트 하나가 부호(양 혹은 음)르 다른 비트들이 숫자의 절대값을 저장한다.  
[2 보수 (two's complement)](#twos-complement) 참조.

**<a name="silent-failure">무소식 고장 (silent failure)</a>**:
어떠한 경고 메시지도 없이 고장남.
무소식 고장(silent failure)는 탐지하고 디버깅하기 어렵다.

**<a name="slice">슬라이스 (slice)</a>**:
더 커다란 시퀀스의 정규 부분시퀀스(subsequence)
예를 들어, 첫 다섯개 요소 혹은 모든 두번째 요소.

**<a name="sql">구조적 질의 언어 (SQL, Structured Query Language)</a>** :
[관계형 데이터베이스 (relational databases)](#relational-database)에 연산을 기술하는데 사용되는
특수 목적 언어(special-purpose language)

**<a name="sql-injection-attack">SQL주입공격 (SQL injection attack)</a>**:
사용자 입력값에 악성 SQL 문장을 포함한 프로그램으로 공격.
만약 사용자 입력 텍스트가 직접 SQL문장으로 복사되면, 데이터베이스에서 실행될 것이다.

**<a name="ssh">SSH</a>**:
컴퓨터 사이에 보안 통신을 위해 사용되는 시큐어 쉘(secure shell)[프로토콜(protocol)](#protocol).
종종 SSH는 컴퓨터 사이 [원격 로그인(remote login)](#remote-login)으로도 사용된다.

**<a name="ssh-key">SSH 키 (SSH key)</a>**:
다른 곳에 컴퓨터나 사용자를 식별하는 디지털 키.

**<a name="stack-frame">스택프레임 (stack frame)</a>**:
함수 로컬 변수에 저장공간을 제공하는 자료구조.
함수가 매번 호출될 때, 신규 스택프레임이 생성되고, 
[콜스택(call stack)](#call-stack) 위에 놓여진다.
함수가 반환될 때, 해당 스택프레임은 폐기된다.

**<a name="standard-input">표준입력 (standard input, stdin)</a>**:
프로세스 기본 입력 스트림.
인터랙티브 명령-라인 응용프로그램에서, 표준입력은 통상 키보드에 연결된다;
[파이프(pipe)](#pipe)에서는 표준입력은 이전 프로세스 [표준출력(standard output)](#standard-output)으로부터 데이터를 받는다.

**<a name="standard-output">표준출력(standard output, stdout)</a>**:
프로세스 기본 출력 스트림.
인터랙티브 명령-라인 응용프로그램에서, 표준출력에 전송된 데이터가 화면 스크린에 출력된다;
[파이프(pipe)](#pipe)에서는 표준출력이 다음 프로세스에 [표준입력(standard input)](#standard-input)으로 넘겨진다.

**<a name="stride">스트라이드 (stride)</a>**:
[슬라이스(slice)](#slice) 연속 요소(element) 사이 오프셋(offset).

**<a name="string">문자열(string)</a>**:
"문자 열(character string)"을 줄인 것, 0 혹은 그 이상 문자 [시퀀스(sequence(](#sequence).

**<a name="sub-directory">하위-디렉토리 (sub-directory)</a>**:
다른 디렉토리 내부에 담겨진 디렉토리.

**<a name="tab-completion">자동탭완성 (tab completion)</a>**:
많은 인터랙티브 시스템에서 제공되는 기능으로 
탭(Tab)키를 눌러 자동으로 해당 단어 혹은 명령어를 완성한다.

**<a name="table-database">(데이터베이스에서) 테이블(table)</a>** :
[관계형 데이터베이스(relational database)](#relational-database)에 데이터 집합으로
[레코드(records)](#record-database) 집합으로 조직화되고, 각 레코드는 동일한 [필드(fields)](#field-database)를 갖는다.

**<a name="test-oracle">시금석 (test oracle)</a>**:
테스트 결과를 비교할 수 있는 프로그램, 장치, 데이터셋, 혹은 인력.

**<a name="test-driven-development">테스트 주도 개발 (test-driven development, TDD)</a>**:
테스트할 코드를 작성하기 *이전*에 단위 테스트를 작성하는 관행.

**<a name="timestamp">시간도장(timestamp)</a>**:
특정 사건(event)이 발생한 시점을 기록.

**<a name="tuple">튜플(tuple)</a>**:
[불변(immutable)](#immutable) [시퀀스(sequence)](#sequence) 값.

**<a name="twos-complement">2 보수 (two's complement)</a>**:
자동차 주행 기록계처럼 감싸서 숫자를 표현하는 기법(scheme).
그래서, 111...111이 -1을 표현.
[부호와 크기 (sign and magnitude)](#sign-and-magnitude) 참조.

**<a name="user-group">사용자 그룹 (user group)</a>**:
컴퓨터 시스템 상에 사용자 집합.

**<a name="user-group-id">사용자 그룹 ID(user group ID)</a>**:
[사용자 그룹(user group)](#user-group)을 특정하는 숫자 ID.

**<a name="user-group-name">사용자 그룹명 (user group name)</a>**:
[사용자 그룹(user group)](#user-group)에 대한 텍스트 명칭.

**<a name="user-id">사용자 ID(user ID)</a>**:
숫자 ID로 컴퓨터 시스템에 개인 사용자를 특정한다.  
[사용자명 (user name)](#user-name) 참조.

**<a name="user-name">사용자명(user name)</a>**:
컴퓨터 시스템에 사용자에 대한 텍스트 명칭.  
[user ID](#user-id) 참조.

**<a name="variable">변수 (variable)</a>**:
값 혹은 값 집합과 연결되는 프로그램에 있는 명칭.

**<a name="version-control">버젼제어 (version control)</a>**:
파일 집합에 대한 변경사항을 관리하는 도구.
각 변경집합은 파일에 새로운 [수정(revision)](#revision) 사항을 생성한다;
버젼제어시스템은 사용자로 하여금 신뢰성있게 과거 수정사항을 되살리게 하고, 
다른 사용자들로 인한 충돌되는 변경사항을 관리할 수 있게 돕는다.

**<a name="while-loop">while 루프 (while loop)</a>**:
조건이 참(true)이기만 하면 계속 실행되는 루프.
[for 루프(for loop)](#for-loop) 참조.

**<a name="wildcard">와일드카드 (wildcard)</a>**:
패턴매칭에 사용되는 문자.
유닉스 쉘에서 와일드카드 "*"은 0 혹은 그이상 문자를 매칭한다.
그래서 `*.txt`은 `.txt`으로 끝나는 이름을 갖는 모든 파일을 매칭한다.
