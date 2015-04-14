---
layout: lesson
root: ../..
title: SQL 참고 정보 (SQL Reference)
---

#### 기본 쿼리 (Basic Queries)

테이블에서 하나 혹은 그 이상 칼럼을 선택한다:

    SELECT column_name_1, column_name_2 FROM table_name;

테이블에서 모든 칼럼을 선택한다:

    SELECT * FROM table_name;

쿼리에 유일한(unique) 결과만 얻는다:

    SELECT DISTINCT column_name FROM table_name;

쿼리에 계산을 수행한다:

    SELECT column_name_1, ROUND(column_name_2 / 1000.0) FROM table_name;

결과를 오름차순으로 정렬한다:

    SELECT * FROM table_name ORDER BY column_name_1;

결과를 오름차순과 내림차순으로 정렬한다:

    SELECT * FROM table_name ORDER BY column_name_1 ASC, column_name_2 DESC;

#### 필터링(Filtering)

조선을 만족하는 데이터만 선택한다:

    SELECT * FROM table_name WHERE column_name > 0;

조건 조합을 만족하는 데이터만 선택한다:

    SELECT * FROM table_name WHERE (column_name_1 >= 1000) AND (column_name_2 = 'A' OR column_name_2 = 'B');

#### 결측 데이터 (Missing Data)

`NULL`을 사용해서 결측 데이터를 표현한다:

`NULL`은 0, 거짓(false), 혹은 다른 어떤 특정한 값은 아니다.
`NULL`을 포함하는 연산은 `NULL`이 된다. 그래서 `1+NULL`, `2>NULL`, `3=NULL`은 모두 `NULL`이 된다.

값이 null인지 테스트한다:

    SELECT * FROM table_name WHERE column_name IS NULL;

값이 null이 아닌지 테스트한다:

    SELECT * FROM table_name WHERE column_name IS NOT NULL;

#### 그룹으로 분류하기(Grouping) 그리고 총합(Aggregation)

총합(aggregation) 함수를 사용해서 값을 결합한다:

    SELECT SUM(column_name_1) FROM table_name;

그룹으로 데이터를 결합하고, 그룹에 결합된 값을 계산한다:

    SELECT column_name_1, SUM(column_name_2), COUNT(*) FROM table_name GROUP BY column_name_1;

#### 합병(Joins)

두 테이블에서 데이터를 합병(join)한다:

    SELECT * FROM table_name_1 JOIN table_name_2 ON table_name_1.column_name = table_name_2.column_name;

#### 쿼리 작성하기 (Writing Queries)

SQL 명령어는 다음 순서로 결합되어야 한다:
`SELECT`, `FROM`, `JOIN`, `ON`, `WHERE`, `GROUP BY`, `ORDER BY`.

#### 테이블 생성하기 (Creating Tables)

칼럼 이름과 자료형을 명시해서 테이블을 생성한다.
기본키, 외래키, 제약조건을 포함한다.

    CREATE TABLE survey(
        taken   INTEGER NOT NULL,
        person  TEXT,
        quant   REAL NOT NULL,
        PRIMARY KEY(taken, quant),
        FOREIGN KEY(person) REFERENCES person(ident)
    );

#### 프로그래밍 (Programming)

다음 순서로 범용 프로그래밍 언어에서 쿼리를 실행한다:

*   적절한 라이브러리를 적재 (loading the appropriate library)
*   연결을 생성 (creating a connection)
*   커서 생성 (creating a cursor)
*   반복적으로 적용:
    *   쿼리 실행 (execute a query)
    *   일부 혹은 전체 결과 가져오기 (fetch some or all results)
*   커서 폐기 (disposing of the cursor)
*   연결 종료 (closing the connection)

파이썬 예제:

    import sqlite3
    connection = sqlite3.connect("database_name")
    cursor = connection.cursor()
    cursor.execute("...query...")
    for r in cursor.fetchall():
        ...process result r...
    cursor.close()
    connection.close()
