A = LOAD 'input/a.txt' USING PigStorage() AS ( lines:chararray ); 

-- The Tokenize splits a line into a bag of words, Flatten command will unnest these bags into words 
Wordlist = FOREACH A GENERATE FLATTEN ( TOKENIZE ( lines ) ) as word; 

--Group command will group the words 
GroupWords = GROUP Wordlist BY word; 

--Count the number of occurences of each group. 
CountGroupWords = FOREACH GroupWords GENERATE group as word, COUNT(Wordlist) as num_occurence; 

--Sort the output 
WordCountSorted = ORDER CountGroupWords BY $1 DESC; 

--Store into hdfs 
STORE CountGroupWords INTO 'hdfs:///home/training/wordcount' USING PigStorage(','); 