---
layout: default
code_page: true
code_url: "https://github.com/jackmaney/Diophantus"
---

<h1>Diophantus</h1>

In order to learn Java, I'm reconstructing some (long since lost) code that I wrote in Mathematica as a graduate student.

Back when you memorized your multiplication tables as a kid, something that made that task easy was the [Fundamental Theorem of Arithmetic](https://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic), which states that every natural number larger than 1 factors uniquely into prime numbers.

However, there are other, stranger algebraic structures where factorizations need not be unique.

Let <code>d</code> denote a negative, square-free integer. If we consider the set

<pre><code>Z[sqrt(d)] = { a + b * sqrt(d) | a,b are integers }</code></pre></center>

then, it turns out that irreducible factorizations need not be unique. In particular, if <code>d = -5</code>, then we have

<pre><code>6 = 2 * 3 = (1 + sqrt(-5))(1 - sqrt(-5))</code></pre>

and it can be shown that each of <code>2, 3, 1+sqrt(-5), 1-sqrt(-5)</code> are irreducible (ie they "can't be broken down anymore" under multiplication).

The ultimate aim of this software distribution is to compute, for given <code>a</code>,<code>b</code>, and <code>d</code>, all of the irreducible factorizations of <code>a + b * sqrt(d)</code> in <code>Z[sqrt(d)]</code>.

<h2>Example</h2>

Take a look at the file <a href="https://github.com/jackmaney/Diophantus/blob/master/src/com/jackmaney/Diophantus/Diophantus.java">Diophantus.java in com.jackmaney.Diophantus</a>. The source of that file (as of this writing) is:

{% highlight java linenos %}

package com.jackmaney.Diophantus;


import com.jackmaney.Diophantus.element.Element;


public class Diophantus {

    public static void main(String[] args) {
        Element e = new Element(6,0,-5);

        System.out.println(e.getIrreducibleFactorizations());


    }

}

{% endhighlight %}


Note that we're creating a new <code>Element</code> that corresponds to <code>6 = 6 + 0 * sqrt(-5)</code>. The output is a <code>Vector</code> of <a  href="https://github.com/jackmaney/Diophantus/blob/master/src/com/jackmaney/Diophantus/Factorization.java"><code>Factorizations</code></a> that, when printed, looks like

<pre><code>[(1 - 1 * sqrt(-5))*(1 + 1 * sqrt(-5)), 2*3]</code></pre>

conforming to our expectations above. Of course, feel free to tinker around with the parameters in this class. For example:

<ul>
<li>The irreducible factorizations of <code>81</code> in <code>Z[sqrt(-14)]</code> are <code>[(5 - 2 * sqrt(-14))*(5 + 2 * sqrt(-14)), 3^4]</code>.</li>
<li>There is only one irreducible factorization of <code>1024 + 768 * sqrt(-39)</code> in <code>Z[sqrt(-39)]</code>, namely <code>2^8*(4 + 3 * sqrt(-39))</code>.</li>
<li>That doesn't mean that every element of <code>Z[sqrt(-39)]</code> enjoys unique factorization! The factorizations of <code>1000 + 1000 * sqrt(-39)</code> are:
<pre><code>[5*(19 + 1 * sqrt(-39))*(29 + 9 * sqrt(-39)),
2*5*(7 + 3 * sqrt(-39))*(31 + 1 * sqrt(-39)),
2^3*5^3*(1 + 1 * sqrt(-39))]</code></pre></li>
<li>There are two factorizations of <code>1024 + 768 * sqrt(-191)</code> in <code>Z[sqrt(-191)]</code>:

<pre><code>[(33 + 1 * sqrt(-191))*(141 + 19 * sqrt(-191)),
2^8*(4 + 3 * sqrt(-191))]</code></pre>
</li>
</ul>
<h2>Why "Diophantus"?</h2>


<a href="https://en.wikipedia.org/wiki/Diophantus">Diophantus of Alexandria</a> was an ancient Greek mathematician and philosopher after whom <a href="https://en.wikipedia.org/wiki/Diophantine_equation">Diophantine equations</a> are named. Finding irreducible factors of a given element of <code>Z[sqrt(d)]</code> hinges upon finding integer solutions for <code>x</code> and <code>y</code> to the following Diophantine equation:

<pre><code>x^2 - d * y^2 = n</code></pre>

Hence, the name.
