---
layout: lesson
root: ../..
title: 숫자(Numbers)
---

어떻게 숫자가 저장되는지 살펴보면서 시작해봅시다.
만약 0과 1 두 개의 숫자(digit)만 있다면, 양의 정수를 저장하는 자연스러운 방식은 기수(base)가 2인 이진법을 사용하는 것이다. 그래서 
이진수 1001<sub>2</sub> 은 십진수로 (1&times;2<sup>3</sup>)+(0&times;2<sup>2</sup>)+(0&times;2<sup>1</sup>)+(1&times;2<sup>0</sup>) = 9<sub>10</sub>이 된다.
마찬가지 방식으로 기호 표기를 위해서 1 비트를 따로 떼어서 음수에 대해서 이 방식을 확장하는 것도 자연스럽니다.
예를 들어, 양수로 0을, 음수로 1을 사용한다면, 
+9<sub>10</sub> 은 01001<sub>2</sub>이 될 것이고, -9<sub>10</sub> 은 11001<sub>10</sub>이 될 것이다.

이 표기법에는 두가지 문제가 있다. 첫번째는 이 기법은 0에 대해서 2가지 표현법이 있다. (00000<sub>2</sub> and 10000<sub>2</sub>)
반듯이 치명적이지는 않지만, 다음과 같이 코드를 작성할 때, 이 기법이 "자연"스럽다고 주장은 사라져버린다.

~~~
if (length != +0) and (length != -0)
~~~
{:class="in"}

또 다른 문제는 [부호 크기 표현(sign and magnitude representation)](../../gloss.html#sign-and-magnitude)으로 덧셈과 다른 연산에 필요한 회로는 [2의 보수(two's complement)](../../gloss.html#twos-complement)로 불리는 것에 필요한 하드웨어보다도 더 복잡하다. 양의 정수를 미러링하는 대신에 2의 보수는 자동차의 속도계처럼 0 이하로 내려갈때 다시 이월한다. 
만약 숫자마다 4 비트를 사용한다면, 0<sub>10</sub> 은 0000<sub>2</sub>, -1<sub>10</sub>은 1111<sub>2</sub>이 된다.
-2<sub>10</sub>은 1110<sub>2</sub>, -3<sub>10</sub> 은 1101<sub>2</sub>, 등등이 되고, 표현할 수 있는 가장 큰 음수는 1000<sub>2</sub>, 즉 -8이 된다.
그리고 나서 다시 표현이 다시 돌아가서 0111<sub>2</sub> 은 7<sub>10</sub>이 된다.

이 기법이 직관적이지는 않지만 부호 크기 표현의 "0이 두개 되는" 문제를 해결하고, 하드웨어가 더 싸고 빠르게 할 수 있다. 보너스로, 첫번째 비트를 살펴보는 것만으로 숫자가 양수인지 음수인지 분간할 수 있다. 음수는 1, 양수는 1이 숫자의 첫번째 비트가 된다. 다만 이상한 것은 비대칭성이다.
왜냐하면 0 이 양수로 분류가 되어서 숫자가 -8에서 7 혹은 -16에서 15, 등등이 된다.
결과적으로 `x`가 유효한 숫자일지라도, `-x`는 유효하지 않을 수 있다.



Finding a good representation for real numbers
(called [floating point numbers](../../gloss.html#float-point-number),
since the decimal point can move around)
is a much harder problem.
The root of the problem is that
we cannot represent an infinite number of real values with a finite set of bit patterns.
And unlike integers,
no matter what values we *do* represent,
there will be an infinite number of values between each of them that we can't.

Floating point numbers are usually represented using sign, magnitude, and an exponent.
In a 32-bit word,
the IEEE 754 standard calls for 1 bit of sign,
23 bits for the magnitude (or *mantissa*),
and 8 bits for the exponent.
To illustrate the problems with floating point,
we'll use a much dumber representation:
we'll only worry about positive values without fractional parts,
and we'll only use 3 for the magnitude and 2 for the exponent.

<!--- Remove this style when vertical headers was supported by pandoc:
https://github.com/jgm/pandoc/issues/1359 -->
<style>
.table-exponent td {
    width:17%;
}
.table-exponent td.table-exponent-header {
    font-weight: bold;
}
</style>

<!--- Merge cells around "Exponent" when colspan was supported by pandoc:
https://github.com/jgm/pandoc/issues/1340 -->
<table class="table table-striped table-exponent">
<tr><td></td>        <td>   </td><td></td><td class="table-exponent-header">Exponent</td><td></td><td></td></tr>
<tr><td></td>        <td>   </td><td class="table-exponent-header">00</td><td class="table-exponent-header">01</td><td class="table-exponent-header">10</td><td class="table-exponent-header">11</td></tr>
<tr><td></td>        <td class="table-exponent-header">000</td><td> 0</td><td> 0</td><td> 0</td><td> 0</td></tr>
<tr><td></td>        <td class="table-exponent-header">001</td><td> 1</td><td> 2</td><td> 4</td><td> 8</td></tr>
<tr><td></td>        <td class="table-exponent-header">010</td><td> 2</td><td> 4</td><td> 8</td><td>16</td></tr>
<tr><td class="table-exponent-header">Mantissa</td><td class="table-exponent-header">011</td><td> 3</td><td> 6</td><td>12</td><td>24</td></tr>
<tr><td></td>        <td class="table-exponent-header">100</td><td> 4</td><td> 8</td><td>16</td><td>32</td></tr>
<tr><td></td>        <td class="table-exponent-header">101</td><td> 5</td><td>10</td><td>20</td><td>40</td></tr>
<tr><td></td>        <td class="table-exponent-header">110</td><td> 6</td><td>12</td><td>24</td><td>48</td></tr>
<tr><td></td>        <td class="table-exponent-header">111</td><td> 7</td><td>14</td><td>28</td><td>56</td></tr>
</table>

The table above
shows the values that we can represent this way.
Each one is the mantissa times two to the exponent.
For example, the decimal values 48 is binary 110 times 2 to the binary 11 power,
which is 6 times 2 to the third,
or 6 times 8.
(Note that real floating point representations like the IEEE 754 standard
don't have the redundancy shown in this table,
but that doesn't affect our argument.)

The first thing you should notice is that there are a lot of values we *can't* store.
We can do 8 and 10, for example, but not 9.
This is exactly like the problems hand calculators have with fractions like 1/3:
in decimal, we have to round that to 0.3333 or 0.3334.

But if this scheme has no representation for 9,
then 8+1 must be stored as either 8 or 10.
This raises an interesting question:
if 8+1 is 8, what is 8+1+1?
If we add from the left, 8+1 is 8, plus another 1 is 8 again.
If we add from the right, though, 1+1 is 2, and 2+8 is 10.
Changing the order of operations can make the difference between right and wrong.
There's no randomness involved&mdash;a particular order of operations
will always produce the same result&mdash;but
as the number of steps increases,
so too does the difficulty of figuring out what the best order is.

This is the sort of problem that numerical analysts spend their time on.
In this case, if we sort the values we're adding, then add from smallest to largest,
it gives us a better chance of getting the best possible answer.
In other situations,
like inverting a matrix,
the rules are much more complicated.

Here's another observation about our uneven number line:
the spacing between the values we can represent is uneven,
but the relative spacing between each set of values stays the same,
i.e., the first group is separated by 1, then the separation becomes 2, then 4, then 8,
so that the ratio of the spacing to the values stays roughly constant.
This happens because we're multiplying the same fixed set of mantissas by ever-larger exponents,
and it points us at a couple of useful definitions.

The [absolute error](../../gloss.html#absolute-error) in some approximation
is simply the absolute value of the difference between the actual value and the approximation.
The [relative error](../../gloss.html#relative-error),
on the other hand,
is the ratio of the absolute error to the value we're approximating.
For example, if we're off by 1 in approximating 8+1 and 56+1,
the absolute error is the same in both cases,
but the relative error in the first case is 1/9 = 11%,
while the relative error in the second case is only 1/57 = 1.7%.
When we're thinking about floating point numbers,
relative error is almost always more useful than absolute error.
After all,
it makes little sense to say that we're off by a hundredth when the value in question is a billionth.

To see why this matters, let's have a look at a little program:

~~~
nines = []
sums = []
current = 0.0
for i in range(1, 10):
    num = 9.0 / (10.0 ** i)
    nines.append(num)
    current += num
    sums.append(current)

for i in range(len(nines)):
    print '%.18f %.18f' % (nines[i], sums[i])
~~~
{:class="in"}

The loop runs over the integers from 1 to 9 inclusive.
Using those values, we create the numbers 0.9, 0.09, 0.009, and so on, and put them in the list `vals`.
We then calculate the sum of those numbers.
Clearly, this should be 0.9, 0.99, 0.999, and so on.
But is it?

<table class="table table-striped">
<tr><td>1</td><td>0.900000000000000022</td><td>0.900000000000000022</td></tr>
<tr><td>2</td><td>0.089999999999999997</td><td>0.989999999999999991</td></tr>
<tr><td>3</td><td>0.008999999999999999</td><td>0.998999999999999999</td></tr>
<tr><td>4</td><td>0.000900000000000000</td><td>0.999900000000000011</td></tr>
<tr><td>5</td><td>0.000090000000000000</td><td>0.999990000000000046</td></tr>
<tr><td>6</td><td>0.000009000000000000</td><td>0.999999000000000082</td></tr>
<tr><td>7</td><td>0.000000900000000000</td><td>0.999999900000000053</td></tr>
<tr><td>8</td><td>0.000000090000000000</td><td>0.999999990000000061</td></tr>
<tr><td>9</td><td>0.000000009000000000</td><td>0.999999999000000028</td></tr>
</table>

Here are our answers.
The first column is the loop index;
the second, what we actually got when we tried to calculate 0.9, 0.09, and so on,
and the third is the cumulative sum.

The first thing you should notice is that the very first value contributing to our sum is already slightly off.
Even with 23 bits for a mantissa,
we cannot exactly represent 0.9 in base 2,
any more than we can exactly represent 1/3 in base 10.
Doubling the size of the mantissa would reduce the error,
but we can't ever eliminate it.

The second thing to notice is that our approximation to 0.0009 actually appears accurate,
as do all of the approximations after that.
This may be misleading, though:
after all,
we've only printed things out to 18 decimal places.
As for the errors in the last few digits of the sums,
there doesn't appear to be any regular pattern in the way they increase and decrease.

This phenomenon is one of the things that makes testing scientific programs hard.
If a function uses floating point numbers,
what do we compare its result to
if we want to check that it's working correctly?
If we compared the sum of the first few numbers in `vals` to what it's supposed to be,
the answer could be `False`,
even if we're initializing the list with the right values,
and calculating the sum correctly.
This is a genuinely hard problem,
and no one has a good generic answer.
The root of our problem is that we're using approximations,
and each approximation has to be judged on its own merits.

There are things you can do, though.
The first rule is,
compare what you get to analytic solutions whenever you can.
For example,
if you're looking at the behavior of drops of liquid helium,
start by checking your program's output on a stationary spherical drop in zero gravity.
You should be able to calculate the right answer in that case,
and if your program doesn't work for that,
it probably won't work for anything else.

The second rule is to compare more complex versions of your code to simpler ones.
If you're about to replace a simple algorithm for calculating heat transfer with one that's more complex,
but hopefully faster,
don't throw the old code away.
Instead,
use its output as a check on the correctness of the new code.
And if you bump into someone at a conference who has a program that can calculate some of the same results as yours,
swap data sets:
it'll help you both.

The third rule is, never use `==` (or `!=`) on floating point numbers,
because two numbers calculated in different ways will probably not have exactly the same bits.
Instead,
check to see whether two values are within some tolerance,
and if they are,
treat them as equal.
Doing this forces you to make your tolerances explicit,
which is useful in its own right
(just as putting error bars on experimental results is useful).
