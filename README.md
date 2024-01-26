# SentimentAnalysis
A very rough approximation to sentiment analysis on works of literature. Upon reading "The emotional arcs of stories are dominated by six basic shapes" (Reagan et al., 2016), which you can find [here](https://epjdatascience.springeropen.com/articles/10.1140/epjds/s13688-016-0093-1), I decided to try to replicate a rough version of their experiment just to see if I could do it reasonably well and reasonably quickly. I came across almost immediately the R package tidytext, by Julia Silge (which complements [her book](https://www.tidytextmining.com/)). It contains, among other tools, the [AFINN list](https://darenr.github.io/afinn/), which assigns a numeric value between -5 and +5 to >2400 English words. This allows for an almost trivial implementation of a very rough solution to the problem of sentiment analysis. While subtle (and not-so-subtle) aspects of language usually go unnoticed in this approach (i.e.: sarcasm, some comparations, some negations, almost all double negations, etc.) it yields fun results. Overall, a fun and quick project for a slow morning.

As an example, this is what the plot of Dracula looks like. Some shortcomings of this approach can be observed here. Look at the first arrow, the one in the top-left. When a character becomes aware of a major problem (in fact, the main plot of the novel) he starts to use many adjectives and adverbs that would otherwise convey a more positive meaning, but which here (for example) serve as emphatic markers: great, dear, strong...

Still, not bad for twenty-something lines of code!

![Dracula's sentiment analysis.](https://github.com/malmriv/SentimentAnalysis/blob/main/images/DraculaAnalysis.png?raw=true)

