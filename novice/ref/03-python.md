---
layout: lesson
root: ../..
title: 파이썬 참고 정보 (Python Reference)
---

#### 기본 연산

*   `variable = value`을 사용해서 변수에 값을 대입한다.
*   `print first, second, third`을 사용해서 값을 화면에 출력한다.
*   파이썬은 1이 아니 0부터 계수한다.
*   `#`으로 주석을 시작한다.
*   블록에 문장은 들여쓴다 (일반적으로 공백 4개).
*   `help(thing)`은 도움말을 화면에 출력한다.
*   `len(thing)`은 컬렉션(collection) 길이를 산출한다.
*   `[value1, value2, value3, ...]`을 통해 리스트를 생성한다.
*   `list_name[i]`은 리스트에서 i번째 값을 선택한다.

#### 제어 흐름 (Control Flow)

*   `for` 루프를 생성해서 한번에 하나씩 컬렉션 요소를 처리한다:

        for variable in collection:
            ...body...

*   `if`, `elif`, `else`을 사용해서 조건문을 생성한다:

        if condition_1:
            ...body...
        elif condition_2:
            ...body...
        else:
            ...body...

*   `==`을 사용해서 같음(equality)을 테스트한다.
*   `X and Y`은 X와 Y가 모두 참(true)일 때만 참이다.
*   `X or Y`은 X 혹은 Y가 모두가 참이거나, 둘중 하나가 참이면 참이다.
*   `assert condition, message`을 사용해서, 프로그램이 실행될 때 어떤 것이 참인지 점검한다.

#### 함수 (Functions)

*   `def name(...params...)`을 통해 새 함수를 정의한다.
*   `def name(param=default)`을 통해 매개변수에 기본설정값을 명시한다.
*   `name(...values...)`을 사용해서 함수를 호출한다.

#### 라이브러리(Libraries)

*   `import libraryname`을 사용해서 프로그램에 라이브러리를 가져온다.
*   `sys` 라이브러리는 다음을 포함한다:
    *   `sys.argv`: 프로그램이 실행하는데 필요한 명령-라인 인자.
    *   `sys.stdin`, `sys.stdout`: 표준입력과 표준출력.
*   `glob.glob(pattern)`은 패턴이 매칭되는 파일 리스트를 반환한다.

#### 배열(Arrays)

*   `import numpy`을 통해 넘파이(NumPy) 라이브러리를 적재한다.
*   `array.shape`을 통해 배열 형상을 알 수 있다.
*   `array[x, y]`을 통해 배열에 특정 단일 요소를 선택한다.
*   `low:high`을 통해 슬라이스를 구체화하는데 `low`에서 `high-1`까지 요소만 포함된다.
*   `array.mean()`, `array.max()`, `array.min()`을 통해 기본 통계량을 계산한다.
*   `array.mean(axis=0)`을 통해 특정 축(axis)에 대한 통계량을 계산한다.
