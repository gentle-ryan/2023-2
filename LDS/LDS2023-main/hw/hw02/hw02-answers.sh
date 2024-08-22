# Linguistics and Data Science [hw02]
# Release date: 2023-10-08
# Due date: 2023-10-16 1:00 PM

# Q1. How many recipes contain GARUM? (1pt)
grep "GARUM" data/apicius/recipes/*.txt | wc -l

# Q2. List the 10 most frequent words in the recipes containing FISH (1pt)
egrep -o "[A-Z][A-Z][A-Z]+" data/apicius/recipes/*.txt | egrep "FISH" | awk 'BEGIN{FS=".txt:"} {print $2}' | sort | uniq -c | sort -nr | head -10
# egrep -o "[A-Z][A-Z][A-Z]+" data/apicius/recipes/*.txt | egrep "\sFISH\s" | awk 'BEGIN{FS=".txt:"} {print $2}' | sort | uniq -c | sort -nr | head -10
#| egrep "FISH" | 만을 사용할 시 제목에 FISH가 들어있지 않지만, 레시피 설명에 FISH가 들어간 경우도 포함된다. 즉, (제목에 FISH가 들어 있지 않은 레시피).txt:FISH인 경우도 포함된다. 따라서 | egrep "\sFISH\s" |이 더 정확하지 않을까 생각된다.


# Q3. List of all trigrams in all the recipes with their frequencies (2pt)
egrep -o "[a-zA-Z]+\s[a-zA-Z]+\s[a-zA-Z]+" data/apicius/recipes/*.txt |  awk 'BEGIN{FS=".txt:"} {print $2}' | sort | uniq -c | sort -nr > hw/hw02/apicius-3grams.txt
#단어를 대소문자를 포함하여 알파벳이 한개 이상 나오는 것을 한단어로 여겼으며, 공백으로 세 단어를 하나의 연쇄로 만들었다.


# Q4. Print the English name, the Latin name, and the recipe of each food (1pt)
awk -f hw/hw02/hw02-print-recipes.awk data/apicius/recipes.txt