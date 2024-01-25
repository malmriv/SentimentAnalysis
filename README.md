# SentimentAnalysis
This is a very rough approximation at preforming a sentiment analysis on works of literature. Upon reading "The emotional arcs of stories are dominated by six basic shapes" (Reagan et al., 2016), which you can find [here](https://epjdatascience.springeropen.com/articles/10.1140/epjds/s13688-016-0093-1), I decided to try to replicate a rough version of their experiment just to see if I could do it reasonably well and reasonably quickly. I found almost immediately the R package tidytext, by Julia Silge, which contains among other tools the [AFINN library](https://darenr.github.io/afinn/), which assigns a numeric value to >2500 common English words. This allows for an almost trivial implementation of a very rough solution to the problem of sentiment analysis. While subtle (and not-so-subtle) aspects of language usually go unnoticed (i.e.: sarcasm, some comparations, some negations, almost all double negations, etc.) it yields fun results. Overall, a fun and quick project for a slow morning.

As an example, this is what the plot of Dracula looks like:

![asdf](https://github.com/malmriv/SentimentAnalysis/blob/main/images/Captura%20de%20pantalla%202024-01-25%20a%20las%2014.09.41.png?raw=true)



