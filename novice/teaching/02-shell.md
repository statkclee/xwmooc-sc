---
layout: lesson
root: ../..
title: 유닉스 쉘(Shell)
---

많은 분들이 쉘(shell)을 지금도 가르쳐야 하는지 질문을 한다.
결국, 수천개 데이터 파일 이름을 변경하고자 하는 사람 누구나 쉽게 파이썬 인터프리터(Python Interpreter)를 통해서 작업을 할 수 있고, 심도 깊은 데이터 분석을 하는 누구나 R Studio나 IPython Notebook 내부에서 원하는 작업 대부분을 할 수 있다. 그런데 왜 쉘을 가르쳐야 할까요?  

첫번째 대답은 "너무나 많은 것들이 쉘에 의존성을 갖기 때문이다." 소프트웨어 설치, 기본 편집기 환경설정, 원격으로 컴퓨터 제어하기 등등 모두 쉘 사용에 프로그래머/사용자/운영자 모두 친숙하다고 가정한다. 표준 입력, 출력(standard input, output) 같은 아이디어와도 연관이 된다. 또한 많은 도구(tools)도 쉘 용어를 사용한다. (예를 들어, IPython에서 `%ls`과 `%cd`는 매직 명령어다.)

두번째 대답은 "컴퓨터를 어떻게 사용할까에 대한 근본적인 아이디어를 소개하는 쉬운 방법이기 때문이다." 유닉스 쉘 사용법을 학습 참여자에게 가르칠 때, 복사해서 붙여넣기 같은 반복을 사용자가 스스로 하기 보다는 컴퓨터가 반복적인 작업(탭 자동완성, `!` 다음 명령문, `for` 루프)을 할 수 있게 가르친다. 또한, 자주하는 작업인 정보를 찾아내서 뽑아내고, 쉘 스크립트를 통해서 나중에 재사용할 수 있도록 저장하고, 연상가능한 이름을 붙이고, 쉘 스크립트 상단에 주석같은 약간의 문서화 작업을 통해서 나중에 고생하기 않고 삶의 질을 높일 수 있는 방법을 가르친다.  



Finally,
and perhaps most importantly,
teaching people the shell lets us teach them
to think about programming in terms of function composition.
In the case of the shell,
this takes the form of pipelines rather than nested function calls,
but the core idea of "small pieces, loosely joined" is the same.

All of this material can be covered in three hours
as long as learners using Windows do not run into roadblocks such as:

*   not being able to figure out where their home directory is
    (particularly if they're using Cygwin);
*   not being able to run a plain text editor;
    and
*   the shell refusing to run scripts that include DOS line endings.

#### Teaching Notes

*   Have learners open a shell
    and then do `whoami`,
    `pwd`,
    and `ls`.
    Then have them create a directory called `workshop`
    and `cd` into it,
    so that everything else they do during the lesson
    is unlikely to harm whatever files they already have.

*   Get them to run an editor
    and save a file in their `workshop` directory
    as early as possible.
    Doing this is usually the biggest stumbling block during the entire lesson:
    many will try to run the same editor as the instructor
    (which may leave them trapped in the awful nether hell that is Vim),
    or will not know how to navigate to the right directory
    to save their file,
    or will run a word processor rather than a plain text editor.
    The quickest way past these problems is to have more knowledgeable learners
    help those who need it.

*   Tab completion sounds like a small thing: it isn't.
    Re-running old commands using `!123` or `!wc`
    isn't a small thing either,
    and neither are wildcard expansion and `for` loops.
    Each one is an opportunity to repeat one of the big ideas of Software Carpentry:
    if the computer *can* repeat it,
    some programmer somewhere will almost certainly have built 
    some way for the computer *to* repeat it.

*   Building up a pipeline with four or five stages,
    then putting it in a shell script for re-use
    and calling that script inside a `for` loop,
    is a great opportunity to show how
    "seven plus or minus two"
    connects to programming.
    Once we have figured out how to do something moderately complicated,
    we make it re-usable and give it a name
    so that it only takes up one slot in working memory
    rather than several.
    It is also a good opportunity to talk about exploratory programming:
    rather than designing a program up front,
    we can do a few useful things
    and then retroactively decide which are worth encapsulating
    for future re-use.

*   We have to leave out many important things because of time constraints,
    including file permissions, job control, and SSH.
    If learners already understand the basic material,
    this can be covered instead using the online lessons as guidelines.
    These limitations also have follow-on consequences:

*   It's hard to discuss `#!` (shebang) wihtout first discussing permissions,
    which we don't do.

*   Installing Bash and a reasonable set of Unix commands on Windows
    always involves some fiddling and frustration.
    Please see the latest set of installation guidelines for advice,
    and try it out yourself *before* teaching a class.

*   On Windows, it appears that:

    ~~~
    $ cd
    $ cd Desktop
    ~~~
    {:class="in"}

    will always put someone on their desktop.
    Have them create the example directory for the shell exercises there
    so that they can find it easily
    and watch it evolve.

*  Stay within POSIX-compliant commands, as all the teaching materials do.
   Your particular shell may have extensions beyond POSIX that are not available
   on other machines, especially the default OSX bash and Windows bash emulators.
   For example, POSIX `ls` does not have an `--ignore=` or `-I` option, and POSIX
   `head` takes `-n 10` or `-10`, but not the long form of `--lines=10`.

#### Windows

Installing Bash and a reasonable set of Unix commands on Windows
always involves some fiddling and frustration.
Please see the latest set of installation guidelines for advice,
and try it out yourself *before* teaching a class.
Options we have explored include:

1.  [msysGit](http://msysgit.github.io/) (also called "Git Bash"),
2.  [Cygwin](http://www.cygwin.com/),
3.  using a desktop virtual machine, and
4.  having learners connect to a remote Unix machine (typically a VM in the cloud).

Cygwin was the preferred option until mid-2013,
but once we started teaching Git,
msysGit proved to work better.
Desktop virtual machines and cloud-based VMs work well for technically sophisticated learners,
and can reduce installation and configuration at the start of the workshop,
but:

1.  they don't work well on underpowered machines,
2.  they're confusing for novices (because simple things like copy and paste work differently),
3.  learners leave the workshop without a working environment on their operating system of choice, and
4.  learners may show up without having downloaded the VM or the wireless will go down (or become congested) during the lesson.

Whatever you use,
please *test it yourself* on a Windows machine *before* your workshop:
things may always have changed behind your back since your last workshop.
And please also make use of our Windows setup helper.
