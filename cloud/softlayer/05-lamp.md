---
layout: lesson
root: ../..
title: LAMP와 개발환경 구축
---
<div class="objectives" markdown="1">

#### 목표
*   LAMP 설치
*   스타트업 개발 환경 구축
*   설치 중
</div>

### LAMP란?

### LAMP 설치

설치 후 운영 환경 자동화  

~~~
root@vm:/# sudo /etc/init.d/apache2 restart
 * Restarting web server apache2                                         [ OK ]
root@vm:/# sudo /etc/init.d/mysql restart
 * Starting MySQL database server mysqld                                 [ OK ]
~~~
{:class=in}

### phpmyadmin 설치하기
~~~
$ sudo apt-get install phpmyadmin
1. 설치
$ sudo vi /etc/apache2/apache2.conf
# Enable PhpMyAdmin
Include /etc/phpmyadmin/apache.conf
2. 환경 설정 파일 추가
$ sudo /etc/init.d/apache2 restart
3. Apache 웹서버 재시작
http://_ip주소_/phpmyadmin
4. 웹브라우져를 열어서 PhpMyAdmin 접속
$ sudo apt-get remove phpmyadmin
5. 설치파일 삭제
~~~
{:class=in}

### 스타트업 개발 환경 구축

<div class="keypoints" markdown="1">

#### 핵심 정리
*   LAMP 설치
*   스타트업 개발 환경 구축

</div>
