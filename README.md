# AhoCorasick
Implementation of the Aho-Corasick search algorithm on Delphi
The Aho–Corasick algorithm is a string-searching algorithm invented by Alfred V. Aho and Margaret J. Corasick in 1975.
It is a kind of dictionary-matching algorithm that locates elements of a finite set of strings (the "dictionary") within an input text. 
It matches all strings simultaneously. The complexity of the algorithm is linear in the length of the strings plus the length of the searched text plus the number of output matches. 
Note that because all matches are found, there can be a quadratic number of matches if every substring matches (e.g. dictionary = a, aa, aaa, aaaa and input string is aaaa).

#
Реалізація алгоритму пошуку Ахо-Корасік на Delphi
Алгоритм Ахо-Корасік - алгоритм пошуку рядків, створений Альфредом Ахо і Маргарет Корасік. 
Алгоритм реалізує пошук множини підрядків із словника в цьому рядку. 
Час роботи пропорційно O (M + N + K), де N — довжина рядка-зразка, M — сумарна довжина рядків словника, а K — довжина відповіді, тобто сумарна довжина входжень слів із словника в рядок-зразок. 
Тому сумарний час роботи може бути квадратичним (наприклад, якщо в рядку «ааааааа», ми шукаємо слова «а», «аа», «ааа»).
