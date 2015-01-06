---
layout: lesson
root: ../..
title: 파이썬 프로그래밍
---
파이썬 소개로 학습 교재가 작성되었지만, 실제 목적은 프로그래밍에 있어 단 한가지 가장 중요한 아이디어를 소개하는 것이다.
어떻게 문제를 함수를 작성함으로써 해결할 수 있을까? 함수 각각은 프로그래머의 작업 저장소에 들어맞아야 한다.
이것을 가르치기 위해서, 데이터를 리스트와 파일 입출력으로 다루는 메커니즘에 대해서 약간 가르쳐야 한다. 그래야만 작성한 함수가 학습참여자가 실제로 신경쓰는 것을 수행할 수 있다. 가르치는 순서는 아이디어가 소개되면 바로 실무에서 사용될 수 있도록 배치되어 있다. 강사는 언의의 "나머지 90%"를 설명하고 싶은 유혹을 참아내야 한다.   

이번 학습의 두번째 목적은 프로그램이 어떻게 실행하는가에 대한 유용한 정신 모델(mental model)을 전달하는 것이다. (컴퓨터 과학 교육전문가들이 [관념적 기계(notional machine)](../../gloss.html#notional-machine) 이라고 부르는 것으로 프로그램이 잘못되면 디버그할 수 있다.) 특히, 함수 호출 스택(function call stack)이 어떻게 동작하는지 이해해야만 한다.

마지막 예제로 유닉스 파이프-필터(pipe-and-filter) 모델과 함께 동작한 명령-라인 툴(command-line tool)을 작성하게 한다. 이렇게 하는 이유는 첫째 유용한 기술이기 때문이고, 둘째로 학습 참여자가 사용하는 소프트웨어가 마술이 아니라는 것을 이해하도록 돕는다. `grep`같은 도구는 현 시점에서 학습참여자가 작성하는 프로그램보다 훨씬 정교하고 복잡할지 모른다. 하지만, 종류가 다르다는 것보다 규모(scale)의 차이를 인식하는 것이 특히 핵심적이다.


#### 강의 노트

*   파이썬을 사용하는 이유를 설명한다. 왜냐하면,
    *   파이썬은 무료다.
    *   과학관련 라이브러리가 많고, 점점더 많이 개발되어 추가되고 있다.
    *   매우 큰 과학자 커뮤니티가 있다.
    *   초보자가 대부분의 성숙된 다른 언어를 배우는 것보다 쉽다. (원래, 소프트웨어 카펜트리는 펄(perl)을 사용했다. 펄에서 파이썬으로 전환했을 때, 펄로 3일 동안 다룬 내용을 파이썬으로 2일 동안 다룰 수 있었고, 학습 참여자 유지율이 더 높았다.)

*   We do *not* include instructions on running the IPython Notebook in the tutorial
    because we want to focus on the language rather than the tools.
    Instructors should, however, walk learners through some basic operations:
    *   Launch from the command line with `ipython notebook`.
    *   Create a new notebook.
    *   Enter code or data in a cell and execute it.
    *   Explain the difference between `In[#]` and `Out[#]`.

*   Watching the instructor grow programs step by step
    is as helpful to learners as anything to do with Python.
    Resist the urge to update a single cell repeatedly
    (which is what you'd probably do in real life).
    Instead,
    clone the previous cell and write the update in the new copy
    so that learners have a complete record of how the program grew.
    Once you've done this,
    you can say,
    "Now why don't we just breaks things into small functions right from the start?"

*   The discussion of command-line scripts
    assumes that students understand standard I/O and building filters,
    which are covered in the lesson on the shell.

*   Do *not* start the notebook with:

    ~~~
    ipython notebook --pylab [backend]
    ~~~

    The `--pylab` option has been deprecated for a long time,
    and is being removed soon.
