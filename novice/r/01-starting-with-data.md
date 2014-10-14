---
layout: lesson
root: ../..
---



## 환자 데이터(Patient Data) 분석

관절염에 새로운 치료법이 처방된 환자의 염증에 대한 연구를 진행하고 있고, 첫 12 데이터셋(Data Set)을 분석할 필요가 있다.
데이터셋은 [CSV 형식(comma-separated values, 구분자가 콤마 값을 가진 파일 형식)](../../gloss.html#comma-separeted-values)으로 저장되어 있다. 각 행은 환자 한명의 정보로 구성되어 있고, 열은 일련의 날짜 정보를 나타낸다. 첫번째 파일의 첫 몇 행의 정보는 다음과 같다.

<div class='out'><pre class='out'><code>0,0,1,3,1,2,4,7,8,3,3,3,10,5,7,4,7,7,12,18,6,13,11,11,7,7,4,6,8,8,4,4,5,7,3,4,2,3,0,0
0,1,2,1,2,1,3,2,2,6,10,11,5,9,4,4,7,16,8,6,18,4,12,5,12,7,11,5,11,3,3,5,4,4,5,5,1,1,0,1
0,1,1,3,3,2,6,2,5,9,5,7,4,5,4,15,5,11,9,10,19,14,12,17,7,12,11,7,4,2,10,5,4,2,2,3,2,2,1,1
0,0,2,0,4,2,2,1,6,7,10,7,9,13,8,8,15,10,10,7,17,4,4,7,6,15,6,4,9,11,3,5,6,3,3,4,2,3,2,1
0,1,1,3,3,1,3,5,2,4,4,7,6,5,3,10,8,10,6,17,9,14,9,7,13,9,12,6,7,7,9,6,3,2,2,4,2,0,1,1
</code></pre></div>

다음을 수행해야 된다.

* CSV 형식 데이터 파일을 주기억장치에 적재한다.
* 모든 환자에 대해서 각 날짜별로 평균 염증을 계산한다.
* 결과값을 플롯(plot)한다.

상기 모든 것을 수행하기 위해서, 프로그래밍에 관해 약간 학습할 필요가 있다.

#### 목표

* 파일에서 테이블 형식의 데이터를 읽는다.
* 값을 변수에 할당한다.
* 데이터에서 개별적인 값과 일부분을 선택한다.
* 데이터의 데이터프레임에 연산을 수행한다.
* 간단한 그래프를 화면에 출력한다.

### 데이터 적재하기(Loading Data)

염증 데이터를 적재(load)하기 위해서, 먼저 데이터의 위치를 지정할 필요가 있다. 현재 작업 디렉토리를 
`setwd` 함수를 사용해서 CSV 파일이 있는 지점으로 변경한다.
예를 들어, CSV 파일이 홈디렉토리 `swc`로 명명된 디렉토리에 자리하고 있다면, 다음 명령어를 사용하여 작업 디렉토리를 변경한다.

<pre class='in'><code>setwd("~/swc")</code></pre>

유닉스 쉘과 마찬가지로 명령어를 타이핑하고 '엔터(Enter)' (혹은 '리턴(return)') 키를 누른다. RStudio GUI의 메뉴 옵션(`Session` -> `Set Working Directory` -> `Choose Directory...`)을 사용하여 작업 디렉토리를 변경할 수 있다.

이제 `read.csv`를 사용하여 R에 데이터를 적재할 수 있다.

<pre class='in'><code>read.csv(file = "inflammation-01.csv", header = FALSE)</code></pre>

`read.csv(...)` 표현식은 [함수 호출(function call)](../../gloss.html#function-call)로 R에게 요청하여 `read.csv`을 실행하게 한다.

`read.csv`는 두 개의 [인수(arguments)](../../gloss.html#argument)가 있다. 하나는 읽고자 하는 파일 이름이고, 다른 하나는 파일의 첫 행이 데이터의 칼럼(열) 이름 포함 여부다. 파일이름은 [문자열(string)](../../gloss.html#string)이 될 필요가 있어서 인용부호안에 파일이름을 넣는다. 두번째 인수 `header`가 `FALSE`로 할당된 것은 데이터 파일이 칼럼 헤더(column header)를 가지고 있지 않음을 나타낸다. `FALSE` 값과 반대의 경우 `TRUE`가 되는 것은 4번째 학습에서 더 얘기를 나눌 것이다. 

함수의 유용성은 무슨 값이 인수에 전달되든지 주어진 행동을 수행한다는 것이다. 예를 들어, 인수 `file`에 다른 파일의 이름을 제공한다면, `read.csv`는 대신에 그 파일을 읽을 것이다. 다음 학습에서 함수와 인수에 관한 좀더 자세한 내용을 배울 것이다.

함수의 출력결과에 대해서 어떤 특별한 것을 지시하지 않아서, 콘솔에서 `inflammation-01.csv` 파일 전체 내용을 화면에 출력한다. 시도해 보세요.

`read.csv`는 파일을 읽어들이지만, 데이터를 주기억장치(memory)에 저장하지 않는다.
저장을 하기고자 한다면, 데이터프레임을 변소에 할당할 필요가 있다. 변수는 단순히 값에 대한 이름으로 `x`, `current_temperature`, `subject_id`과 같다. 새로운 변수를 생성하여 `<-`을 사용해서 값을 변수에 할당할 수 있다.

<pre class='in'><code>weight_kg <- 55</code></pre>

변수가 값을 가지게 되면, 변수 이름을 타이핑하고 `엔터(Enter)` 혹은 `리턴(return)`을 쳐서 변수를 출력할 수 있다. 일반적으로 변수에 할당하는 경우를 *제외하고* R은 함수나 연산에서 반환되는 임의의 개체를 콘솔에 출력한다.

<pre class='in'><code>weight_kg</code></pre>

<div class='out'><pre class='out'><code>[1] 55
</code></pre></div>

변수로 산수를 할 수 있다.

<pre class='in'><code># weight in pounds:
2.2 * weight_kg</code></pre>

<div class='out'><pre class='out'><code>[1] 121
</code></pre></div>

> **Tip:** `#`문자를 사용해서 코드에 주석을 추가할 수 있다. 이런 방식으로 코드를 문서화하는 것은 매우 유용하다. 그렇게 함으로써 다른 사람이나 자신도 다음에 코드를 읽을 때 코드가 무엇을 하는 것인지 따라가기가 쉽다.

새로운 값을 할당함으로써 개체의 값을 변경할 수 있다.

<pre class='in'><code>weight_kg <- 57.5
# weight in kilograms is now
weight_kg</code></pre>

<div class='out'><pre class='out'><code>[1] 57.5
</code></pre></div>

만약 변수를 이름이 써진 포스트잇 같은 스티커 노트라고 가정한다면, 할당은 특정한 값에 스티커 노트를 붙이는 것과 같다.

<img src="../python/img/python-sticky-note-variables-01.svg" alt="Variables as Sticky Notes" />

이것이 의미하는 바는 한 개체에 값을 할당하는 것은 다른 변수의 값을 변경시키지는 않는다. 예를 들어, 변수에 개체의 무게를 파운드로 저장하자.

<pre class='in'><code>weight_lb <- 2.2 * weight_kg
# weight in kg...
weight_kg</code></pre>

<div class='out'><pre class='out'><code>[1] 57.5
</code></pre></div>

<pre class='in'><code># ...and in pounds
weight_lb</code></pre>

<div class='out'><pre class='out'><code>[1] 126.5
</code></pre></div>

<img src="../python/img/python-sticky-note-variables-02.svg" alt="Creating Another Variable" />

그리고 나서 `weight_kg`를 변경하자.

<pre class='in'><code>weight_kg <- 100.0
# weight in kg now...
weight_kg</code></pre>

<div class='out'><pre class='out'><code>[1] 100
</code></pre></div>

<pre class='in'><code># ...and in weight pounds still
weight_lb</code></pre>

<div class='out'><pre class='out'><code>[1] 126.5
</code></pre></div>

<img src="../python/img/python-sticky-note-variables-03.svg" alt="Updating a Variable" />

`weight_lb` 변수는 값이 어디에서 왔는지 기억하지 않기 때문에, 자동적으로 `weight_kg`이 변경될 때 갱신되지 않는다. 엑셀같은 스프레드쉬트가 동작하는 방식과 이런 점이 다르다.

변수에 어떻게 값을 할당하는지 알기 때문에, `read.csv`을 다시 실행하고 결과를 저장하자.

<pre class='in'><code>dat <- read.csv(file = "inflammation-01.csv", header = FALSE)</code></pre>

상기 문장은 결과를 출력하지 않는데 할당은 어떤 것도 화면에 출력하지 않기 때문이다.
데이터가 주기억장치에 적재되었는지 확인하고자 한다면, 변수의 값을 출력할 수 있다.
하지만, 큰 데이터셋에 대해서는 `head` 함수를 사용해서 데이터의 처음 몇 줄만 화면에 출력하는 것이 편리하다.

<pre class='in'><code>head(dat)</code></pre>

<div class='out'><pre class='out'><code>  V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20
1  0  0  1  3  1  2  4  7  8   3   3   3  10   5   7   4   7   7  12  18
2  0  1  2  1  2  1  3  2  2   6  10  11   5   9   4   4   7  16   8   6
3  0  1  1  3  3  2  6  2  5   9   5   7   4   5   4  15   5  11   9  10
4  0  0  2  0  4  2  2  1  6   7  10   7   9  13   8   8  15  10  10   7
5  0  1  1  3  3  1  3  5  2   4   4   7   6   5   3  10   8  10   6  17
6  0  0  1  2  2  4  2  1  6   4   7   6   6   9   9  15   4  16  18  12
  V21 V22 V23 V24 V25 V26 V27 V28 V29 V30 V31 V32 V33 V34 V35 V36 V37 V38
1   6  13  11  11   7   7   4   6   8   8   4   4   5   7   3   4   2   3
2  18   4  12   5  12   7  11   5  11   3   3   5   4   4   5   5   1   1
3  19  14  12  17   7  12  11   7   4   2  10   5   4   2   2   3   2   2
4  17   4   4   7   6  15   6   4   9  11   3   5   6   3   3   4   2   3
5   9  14   9   7  13   9  12   6   7   7   9   6   3   2   2   4   2   0
6  12   5  18   9   5   3  10   3  12   7   8   4   7   3   5   4   4   3
  V39 V40
1   0   0
2   0   1
3   1   1
4   2   1
5   1   1
6   2   1
</code></pre></div>

#### 도전하기

도표를 그려서 다음 프로그램의 각 문장이 실행된 후에 무슨 변수가 무슨 값을 참조하는지 보이세요.

	mass <- 47.5
	age <- 122
	mass <- mass * 2.0
	age <- age - 20

### Manipulating Data

Now that our data is in memory, we can start doing things with it. 
First, let's ask what type of thing `dat` *is*:


<pre class='in'><code>class(dat)</code></pre>



<div class='out'><pre class='out'><code>[1] "data.frame"
</code></pre></div>

The output tells us that data currently is a data frame in R. 
This is similar to a spreadsheet in MS Excel that many of us are familiar with using.
Data frames are very useful for storing data because you can have a continuous variable, e.g. rainfall, in one column and a categorical variable, e.g. month, in another.

We can see the dimensions, or [shape](../../gloss.html#shape), of the data frame like this:


<pre class='in'><code>dim(dat)</code></pre>



<div class='out'><pre class='out'><code>[1] 60 40
</code></pre></div>

This tells us that our data frame, `dat`, has 60 rows and 40 columns.

If we want to get a single value from the data frame, we can provide an [index](../../gloss.html#index) in square brackets, just as we do in math:


<pre class='in'><code># first value in dat
dat[1, 1]</code></pre>



<div class='out'><pre class='out'><code>[1] 0
</code></pre></div>



<pre class='in'><code># middle value in dat
dat[30, 20]</code></pre>



<div class='out'><pre class='out'><code>[1] 16
</code></pre></div>

An index like `[30, 20]` selects a single element of a data frame, but we can select whole sections as well. 
For example, we can select the first ten days (columns) of values for the first four patients (rows) like this:


<pre class='in'><code>dat[1:4, 1:10]</code></pre>



<div class='out'><pre class='out'><code>  V1 V2 V3 V4 V5 V6 V7 V8 V9 V10
1  0  0  1  3  1  2  4  7  8   3
2  0  1  2  1  2  1  3  2  2   6
3  0  1  1  3  3  2  6  2  5   9
4  0  0  2  0  4  2  2  1  6   7
</code></pre></div>

The [slice](../../gloss.html#slice) `1:4` means, "Start at index 1 and go to index 4."

The slice does not need to start at 1, e.g. the line below selects rows 5 through 10:


<pre class='in'><code>dat[5:10, 1:10]</code></pre>



<div class='out'><pre class='out'><code>   V1 V2 V3 V4 V5 V6 V7 V8 V9 V10
5   0  1  1  3  3  1  3  5  2   4
6   0  0  1  2  2  4  2  1  6   4
7   0  0  2  2  4  2  2  5  5   8
8   0  0  1  2  3  1  2  3  5   3
9   0  0  0  3  1  5  6  5  5   8
10  0  1  1  2  1  3  5  3  5   8
</code></pre></div>
We can use the function `c`, which stands for **c**ombine, to select non-contiguous values:


<pre class='in'><code>dat[c(3, 8, 37, 56), c(10, 14, 29)]</code></pre>



<div class='out'><pre class='out'><code>   V10 V14 V29
3    9   5   4
8    3   5   6
37   6   9  10
56   7  11   9
</code></pre></div>

We also don't have to provide a slice for either the rows or the columns.
If we don't include a slice for the rows, R returns all the rows; if we don't include a slice for the columns, R returns all the columns.
If we don't provide a slice for either rows or columns, e.g. `dat[, ]`, R returns the full data frame.


<pre class='in'><code># All columns from row 5
dat[5, ]</code></pre>



<div class='out'><pre class='out'><code>  V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20
5  0  1  1  3  3  1  3  5  2   4   4   7   6   5   3  10   8  10   6  17
  V21 V22 V23 V24 V25 V26 V27 V28 V29 V30 V31 V32 V33 V34 V35 V36 V37 V38
5   9  14   9   7  13   9  12   6   7   7   9   6   3   2   2   4   2   0
  V39 V40
5   1   1
</code></pre></div>



<pre class='in'><code># All rows from column 16
dat[, 16]</code></pre>



<div class='out'><pre class='out'><code> [1]  4  4 15  8 10 15 13  9 11  6  3  8 12  3  5 10 11  4 11 13 15  5 14
[24] 13  4  9 13  6  7  6 14  3 15  4 15 11  7 10 15  6  5  6 15 11 15  6
[47] 11 15 14  4 10 15 11  6 13  8  4 13 12  9
</code></pre></div>

Now let's perform some common mathematical operations to learn about our inflammation data.
When analyzing data we often want to look at partial statistics, such as the maximum value per patient or the average value per day. 
One way to do this is to select the data we want to create a new temporary data frame, and then perform the calculation on this subset:


<pre class='in'><code># first row, all of the columns
patient_1 <- dat[1, ]
# max inflammation for patient 1
max(patient_1)</code></pre>



<div class='out'><pre class='out'><code>[1] 18
</code></pre></div>

We don't actually need to store the row in a variable of its own. 
Instead, we can combine the selection and the function call:


<pre class='in'><code># max inflammation for patient 2
max(dat[2, ])</code></pre>



<div class='out'><pre class='out'><code>[1] 18
</code></pre></div>

R also has functions for other commons calculations, e.g. finding the minimum, mean, median, and standard deviation of the data:


<pre class='in'><code># minimum inflammation on day 7
min(dat[, 7])</code></pre>



<div class='out'><pre class='out'><code>[1] 1
</code></pre></div>



<pre class='in'><code># mean inflammation on day 7
mean(dat[, 7])</code></pre>



<div class='out'><pre class='out'><code>[1] 3.8
</code></pre></div>



<pre class='in'><code># median inflammation on day 7
median(dat[, 7])</code></pre>



<div class='out'><pre class='out'><code>[1] 4
</code></pre></div>



<pre class='in'><code># standard deviation of inflammation on day 7
sd(dat[, 7])</code></pre>



<div class='out'><pre class='out'><code>[1] 1.725
</code></pre></div>

What if we need the maximum inflammation for all patients, or the average for each day?
As the diagram below shows, we want to perform the operation across a margin of the data frame:

<img src="figure/r-operations-across-axes.svg" alt="Operations Across Axes" />

To support this, we can use the `apply` function.

> **Tip:** To learn about a function in R, e.g. `apply`, we can read its help documention by running `help(apply)` or `?apply`.

`apply` allows us to repeat a function on all of the rows (`MARGIN = 1`) or columns (`MARGIN = 2`) of a data frame.

Thus, to obtain the average inflammation of each patient we will need to calculate the mean of all of the rows (`MARGIN = 1`) of the data frame.


<pre class='in'><code>avg_patient_inflammation <- apply(dat, 1, mean)</code></pre>

And to obtain the average inflammation of each day we will need to calculate the mean of all of the columns (`MARGIN = 2`) of the data frame.


<pre class='in'><code>avg_day_inflammation <- apply(dat, 2, mean)</code></pre>

Since the second argument to `apply` is `MARGIN`, the above command is equivalent to `apply(dat, MARGIN = 2, mean)`.
We'll learn why this is so in the next lesson.

> **Tip:** Some common operations have more efficient alternatives.
For example, you can calculate the row-wise or column-wise means with `rowMeans` and `colMeans`, respectively.

#### Challenge

A subsection of a data frame is called a [slice](../../gloss.html#slice).
We can take slices of character vectors as well:


<pre class='in'><code>element <- c("o", "x", "y", "g", "e", "n")
# first three characters
element[1:3]</code></pre>



<div class='out'><pre class='out'><code>[1] "o" "x" "y"
</code></pre></div>



<pre class='in'><code># last three characters
element[4:6]</code></pre>



<div class='out'><pre class='out'><code>[1] "g" "e" "n"
</code></pre></div>

1.  If the first four characters are selected using the slice `element[1:4]`, how can we obtain the first four characters in reverse order?
    
1.  What is `element[-1]`?
    What is `element[-4]`?
    Given those answers,
    explain what `element[-1:-4]` does.

1.  Use a slice of `element` to create a new character vector that spells the word "eon", e.g. `c("e", "o", "n")`.

### Plotting

The mathematician Richard Hamming once said, "The purpose of computing is insight, not numbers," and the best way to develop insight is often to visualize data.
Visualization deserves an entire lecture (or course) of its own, but we can explore a few of R's plotting features. 

Let's take a look at the average inflammation over time.
Recall that we already calculated these values above using `apply(dat, 2, mean)` and saved them in the variable `avg_day_inflammation`.
Plotting the values is done with the function `plot`.


<pre class='in'><code>plot(avg_day_inflammation)</code></pre>

<img src="figure/01-starting-with-data-plot-avg-inflammation.png" title="plot of chunk plot-avg-inflammation" alt="plot of chunk plot-avg-inflammation" style="display: block; margin: auto;" />

Above, we gave the function `plot` a vector of numbers corresponding to the average inflammation per day across all patients.
`plot` created a scatter plot where the y-axis is the average inflammation level and the x-axis is the order, or index, of the values in the vector, which in this case correspond to the 40 days of treatment.
The result is roughly a linear rise and fall, which is suspicious: based on other studies, we expect a sharper rise and slower fall.
Let's have a look at two other statistics: the maximum and minimum inflammation per day.


<pre class='in'><code>max_day_inflammation <- apply(dat, 2, max)
plot(max_day_inflammation)</code></pre>

<img src="figure/01-starting-with-data-plot-max-inflammation.png" title="plot of chunk plot-max-inflammation" alt="plot of chunk plot-max-inflammation" style="display: block; margin: auto;" />


<pre class='in'><code>min_day_inflammation <- apply(dat, 2, min)
plot(min_day_inflammation)</code></pre>

<img src="figure/01-starting-with-data-plot-min-inflammation.png" title="plot of chunk plot-min-inflammation" alt="plot of chunk plot-min-inflammation" style="display: block; margin: auto;" />

The maximum value rises and falls perfectly smoothly, while the minimum seems to be a step function. Neither result seems particularly likely, so either there's a mistake in our calculations or something is wrong with our data.

#### Challenge

Create a plot showing the standard deviation of the inflammation data 
for each day across all patients.

#### Key Points

* Use `variable <- value` to assign a value to a variable in order to record it in memory.
* Objects are created on demand whenever a value is assigned to them.
* The function `dim` gives the dimensions of a data frame.
* Use `object[x, y]` to select a single element from a data frame.
* Use `from:to` to specify a sequence that includes the indices from `from` to `to`.
* All the indexing and slicing that works on data frames also works on vectors.
* Use `#` to add comments to programs.
* Use `mean`, `max`, `min` and `sd` to calculate simple statistics.
* Use `apply` to calculate statistics across the rows or columns of a data frame.
* Use `plot` to create simple visualizations.

#### Next Steps

Our work so far has convinced us that something's wrong with our first data file.
We would like to check the other 11 the same way, but typing in the same commands repeatedly is tedious and error-prone.
Since computers don't get bored (that we know of), we should create a way to do a complete analysis with a single command, and then figure out how to repeat that step once for each file.
These operations are the subjects of the next two lessons.
