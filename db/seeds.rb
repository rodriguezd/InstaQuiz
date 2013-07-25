# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


######### Quiz 1 ##########################
###########################################

Quiz.create(:name => "Ruby Objects, Classes, and Variables")
Quiz.all[0].questions.create(:content => "What character denotes an instance variable?")

Question.all[0].choices.create(:content => "$")
Question.all[0].choices.create(:content => "#")
Question.all[0].choices.create(:content => "@", :correct => true)
Question.all[0].choices.create(:content => "!")

Quiz.all[0].questions.create(:content => "What reserved word do you use when creating a class?")

Question.all[1].choices.create(:content => "class", :correct => true)
Question.all[1].choices.create(:content => "while")
Question.all[1].choices.create(:content => "def")
Question.all[1].choices.create(:content => "begin")

Quiz.all[0].questions.create(:content => "Which of these is not a type of variable?")

Question.all[2].choices.create(:content => "Local")
Question.all[2].choices.create(:content => "Global")
Question.all[2].choices.create(:content => "Distance", :correct => true)
Question.all[2].choices.create(:content => "Instance")

Quiz.all[0].questions.create(:content => "Which of these correctly tests to see if a is equal to 1?")

Question.all[3].choices.create(:content => "a != 1")
Question.all[3].choices.create(:content => "a ||= 1")
Question.all[3].choices.create(:content => "a = 1")
Question.all[3].choices.create(:content => "a == 1", :correct => true)

Quiz.all[0].questions.create(:content => "What casing is used with constants?")

Question.all[4].choices.create(:content => "CamelCase")
Question.all[4].choices.create(:content => "under_scored")
Question.all[4].choices.create(:content => "UPPERCASE", :correct => true)
Question.all[4].choices.create(:content => "Title case")

Quiz.all[0].questions.create(:content => "What is another name for an instance of a class?")

Question.all[5].choices.create(:content => "A mini class")
Question.all[5].choices.create(:content => "Microclass")
Question.all[5].choices.create(:content => "Macroclass")
Question.all[5].choices.create(:content => "An object", :correct => true)

Quiz.all[0].questions.create(:content => "What character denotes a global variable?")

Question.all[6].choices.create(:content => "$", :correct => true)
Question.all[6].choices.create(:content => "!")
Question.all[6].choices.create(:content => "#")
Question.all[6].choices.create(:content => "@")

Quiz.all[0].questions.create(:content => "Which of these statements outputs the statement 'a is 2'? Assume the following code is set:
a = 2")

Question.all[7].choices.create(:content => "if a != 2 puts 'a is 2' end")
Question.all[7].choices.create(:content => "if a == 1 puts 'a is 2' end")
Question.all[7].choices.create(:content => "if a = 2 puts 'a is 2' end")
Question.all[7].choices.create(:content => "if a == 2 puts 'a is 2' end", :correct => true)

Quiz.all[0].questions.create(:content => "What is the process of figuring out the how the real world is represented in your object oriented program?")

Question.all[8].choices.create(:content => "Object orienting")
Question.all[8].choices.create(:content => "Matrixing")
Question.all[8].choices.create(:content => "Program making")
Question.all[8].choices.create(:content => "Domain modeling", :correct => true)

Quiz.all[0].questions.create(:content => "When you have a lot of values, what can you use instead of the 'if' statement?")

Question.all[9].choices.create(:content => "begin")
Question.all[9].choices.create(:content => "yield")
Question.all[9].choices.create(:content => "ifff")
Question.all[9].choices.create(:content => "case", :correct => true)


######### Quiz 2 ##########################
###########################################
Quiz.create(:name => "Ruby Strings")
Quiz.all[1].questions.create(:content => "What method swaps the case of each letter in the entire string?")

Question.all[10].choices.create(:content => "recase")
Question.all[10].choices.create(:content => "capitalize")
Question.all[10].choices.create(:content => "swapcase", :correct => true)
Question.all[10].choices.create(:content => "titleize")

Quiz.all[1].questions.create(:content => "What string method removes whitespace at the beginning and end of a string?")

Question.all[11].choices.create(:content => "chrem")
Question.all[11].choices.create(:content => "chirp")
Question.all[11].choices.create(:content => "chown")
Question.all[11].choices.create(:content => "chomp", :correct => true)

Quiz.all[1].questions.create(:content => "What special character represents a backspace?")

Question.all[12].choices.create(:content => "\\r")
Question.all[12].choices.create(:content => "\\v")
Question.all[12].choices.create(:content => "\\n")
Question.all[12].choices.create(:content => "\\b", :correct => true)

Quiz.all[1].questions.create(:content => "What method allows you to get a string from standard input?")

Question.all[13].choices.create(:content => "puts")
Question.all[13].choices.create(:content => "give")
Question.all[13].choices.create(:content => "get_input")
Question.all[13].choices.create(:content => "gets", :correct => true)

Quiz.all[1].questions.create(:content => "What method puts the letters of a string in reverse order?")

Question.all[14].choices.create(:content => "reverse", :correct => true)
Question.all[14].choices.create(:content => "backwards")
Question.all[14].choices.create(:content => "upcase")
Question.all[14].choices.create(:content => "rewind")

Quiz.all[1].questions.create(:content => "What string operator multiplies a string?")

Question.all[15].choices.create(:content => "-")
Question.all[15].choices.create(:content => "+")
Question.all[15].choices.create(:content => "/")
Question.all[15].choices.create(:content => "*", :correct => true)

Quiz.all[1].questions.create(:content => "What method tells you what position in the string that letters or words occur in a string?")

Question.all[16].choices.create(:content => "index", :correct => true)
Question.all[16].choices.create(:content => "place_of")
Question.all[16].choices.create(:content => "value_of")
Question.all[16].choices.create(:content => "position")


######### Quiz 3 ##########################
###########################################
Quiz.create(:name => "Ruby Numbers")
Quiz.all[2].questions.create(:content => "Which operator tests to see if two numbers are equal?")

Question.all[17].choices.create(:content => ">")
Question.all[17].choices.create(:content => "<")
Question.all[17].choices.create(:content => "!=")
Question.all[17].choices.create(:content => "==", :correct => true)

Quiz.all[2].questions.create(:content => "Generally speaking, what class are numbers with a decimal point?")

Question.all[18].choices.create(:content => "Fixnum")
Question.all[18].choices.create(:content => "Float", :correct => true)
Question.all[18].choices.create(:content => "Integer")
Question.all[18].choices.create(:content => "Rational")

Quiz.all[2].questions.create(:content => "How does the money library represent monetary values?")

Question.all[19].choices.create(:content => "Cents", :correct => true)
Question.all[19].choices.create(:content => "Gold")
Question.all[19].choices.create(:content => "Dollars")
Question.all[19].choices.create(:content => "Platinum")

Quiz.all[2].questions.create(:content => "Which of these is the exponential operator?
")

Question.all[20].choices.create(:content => "*")
Question.all[20].choices.create(:content => "%")
Question.all[20].choices.create(:content => "**", :correct => true)
Question.all[20].choices.create(:content => "$")

Quiz.all[2].questions.create(:content => "Which of these is the modulus operator?")

Question.all[21].choices.create(:content => "^")
Question.all[21].choices.create(:content => "%", :correct => true)
Question.all[21].choices.create(:content => "#")
Question.all[21].choices.create(:content => "$")

Quiz.all[2].questions.create(:content => "What method converts a string with numbers in it to a floating point number?")

Question.all[22].choices.create(:content => "to_i")
Question.all[22].choices.create(:content => "to_f", :correct => true)
Question.all[22].choices.create(:content => "to_fpn")
Question.all[22].choices.create(:content => "to_rational")

Quiz.all[2].questions.create(:content => "What library would you use to do floating point math on decimals?")

Question.all[23].choices.create(:content => "BigDecimal", :correct => true)
Question.all[23].choices.create(:content => "Fixnum")
Question.all[23].choices.create(:content => "Math")
Question.all[23].choices.create(:content => "FloatingPointMath")

Quiz.all[2].questions.create(:content => "Which operator checks to see that the operand on the left is less than the operand on the right?")

Question.all[24].choices.create(:content => "!=")
Question.all[24].choices.create(:content => ">")
Question.all[24].choices.create(:content => "<=>")
Question.all[24].choices.create(:content => "<", :correct => true)

Quiz.all[2].questions.create(:content => "What method converts a string with a number in it to a Fixnum?")

Question.all[25].choices.create(:content => "to_f")
Question.all[25].choices.create(:content => "to_fixnum")
Question.all[25].choices.create(:content => "to_integer")
Question.all[25].choices.create(:content => "to_i", :correct => true)

Quiz.all[2].questions.create(:content => "Which of these methods will return a random number between 0 and 1000?")

Question.all[26].choices.create(:content => "randomize(1k)")
Question.all[26].choices.create(:content => "rand(1000)", :correct => true)
Question.all[26].choices.create(:content => "rand(1.0)")
Question.all[26].choices.create(:content => "rand()")

Quiz.all[2].questions.create(:content => "Which operator checks to see that two numbers or objects do not equal each other?
")

Question.all[27].choices.create(:content => "!=", :correct => true)
Question.all[27].choices.create(:content => "<=")
Question.all[27].choices.create(:content => "==")
Question.all[27].choices.create(:content => ">")

Quiz.all[2].questions.create(:content => "Which operator tests to see if two numbers are equal?")

Question.all[28].choices.create(:content => "!=")
Question.all[28].choices.create(:content => "<")
Question.all[28].choices.create(:content => ">")
Question.all[28].choices.create(:content => "==", :correct => true)


######### Quiz 4 ##########################
###########################################
Quiz.create(:name => "Ruby Arrays")
Quiz.all[3].questions.create(:content => "What does the following code return?

array = [1, 2, 3]
array.first")

Question.all[29].choices.create(:content => "2")
Question.all[29].choices.create(:content => "Nothing, this is a syntax error.")
Question.all[29].choices.create(:content => "3")
Question.all[29].choices.create(:content => "1", :correct => true)

Quiz.all[3].questions.create(:content => "What does the following return?

array = [1, 2, 3, 4, 5]
array.select { |item| item >= 3 }")

Question.all[30].choices.create(:content => "[1, 2, 3, 4, 5]")
Question.all[30].choices.create(:content => "[2]")
Question.all[30].choices.create(:content => "[3, 4, 5]", :correct => true)
Question.all[30].choices.create(:content => "true")

Quiz.all[3].questions.create(:content => "What is the value of the array variable at the end of this block of code?
array = [1, 2, 3, 4]
array << 5
array.clear")

Question.all[31].choices.create(:content => "[]", :correct => true)
Question.all[31].choices.create(:content => "[1, 2, 3, 4, 1, 2, 3, 4]")
Question.all[31].choices.create(:content => "[5, 1, 2, 3, 4]")
Question.all[31].choices.create(:content => "[1, 2, 3, 4, 5]")

Quiz.all[3].questions.create(:content => "What does the pop method do to an array?")

Question.all[32].choices.create(:content => "Removes an item from the end of an array.", :correct => true)
Question.all[32].choices.create(:content => "Reindexes an array in random order.")
Question.all[32].choices.create(:content => "Adds an item to the beginning of an array.")
Question.all[32].choices.create(:content => "Adds an item to the end of an array.")


Quiz.all[3].questions.create(:content => "What method reverses the items in an array?")
Question.all[33].choices.create(:content => "reverse", :correct => true)
Question.all[33].choices.create(:content => "reorder")
Question.all[33].choices.create(:content => "unshift")
Question.all[33].choices.create(:content => "unsort")

Quiz.all[3].questions.create(:content => "What does the following code return?

array = [1, 2, 3]
array.last")

Question.all[34].choices.create(:content => "1")
Question.all[34].choices.create(:content => "Nothing")
Question.all[34].choices.create(:content => "2")
Question.all[34].choices.create(:content => "3", :correct => true)

Quiz.all[3].questions.create(:content => "What is the number 1 in the following code?

 array[1]")
Question.all[35].choices.create(:content => "Incorrect syntax")
Question.all[35].choices.create(:content => "The index", :correct => true)
Question.all[35].choices.create(:content => "The array")
Question.all[35].choices.create(:content => "The value")

Quiz.all[3].questions.create(:content => "What does the & operator return from two arrays?")

Question.all[36].choices.create(:content => "A unique list of the items common to the two arrays.", :correct => true)
Question.all[36].choices.create(:content => "The difference between the two arrays.")
Question.all[36].choices.create(:content => "A combination of the two arrays.")
Question.all[36].choices.create(:content => "The product of two arrays.")


User.create(:name => "Jordan Trevino", :email => "123@abc.com", :password => "test")
User.create(:name => "Sarah Duve", :email => "sarah@abc.com",:password => "test")
User.create(:name => "David Rodriguez", :email => "david@abc.com",:password => "test")
User.create(:name => "Kirin Masood", :email => "kirin@abc.com",:password => "test")

User.create(:name => "Jennifer Campbell", :email => "jennifer.campbell@flatironschool.com", :password => "test")
User.create(:name => "Alisa Chang", :email => "alisa.chang@flatironschool.com", :password => "test")
User.create(:name => "Kristen Curtis", :email => "kristen.curtis@flatironschool.com", :password => "test")
User.create(:name => "Sarah Duve", :email => "sarah.duve@flatironschool.com", :password => "test")
User.create(:name => "Jennifer Eisenberg", :email => "jennifer.eisenberg@flatironschool.com", :password => "test")
User.create(:name => "Katie Ishibashi", :email => "katie.ishibashi@flatironschool.com", :password => "test")
User.create(:name => "Kirin Masood", :email => "kirin.masood@flatironschool.com", :password => "test")
User.create(:name => "Ruthie Nachmany", :email => "ruthie.nachmany@flatironschool.com", :password => "test")
User.create(:name => "Samantha Radocchia", :email => "samantha.radocchia@flatironschool.com", :password => "test")
User.create(:name => "Anisha Vasandani", :email => "anisha.vasandani@flatironschool.com", :password => "test")
User.create(:name => "Jack Altman", :email => "jack.altman@flatironschool.com", :password => "test")
User.create(:name => "Alex Au", :email => "alex.au@flatironschool.com", :password => "test")
User.create(:name => "Steven Brooks", :email => "steven.brooks@flatironschool.com", :password => "test")
User.create(:name => "Joshua Collins", :email => "joshua.collins@flatironschool.com", :password => "test")
User.create(:name => "Micah Corn", :email =>  "micah.corn@flatironschool.com", :password => "test")
User.create(:name => "Thomas Deatherage", :email => "thomas.deatherage@flatironschool.com", :password => "test")
User.create(:name => "Daniel Friedamn", :email => "daniel.friedman@flatironschool.com", :password => "test")
User.create(:name => "Joseph Giralt", :email => "joe.giralt@flatironschool.com", :password => "test")
User.create(:name => "Chris Gonzales", :email => "chris.gonzales@flatironschool.com", :password => "test")
User.create(:name => "Maxwell Jacobson", :email => "maxwell.jacobson@gmail.com", :password => "test")
User.create(:name => "Mendel Kramer", :email => "mendel.kramer@flatironschool.com", :password => "test")
User.create(:name => "Chris Lake", :email => "chris.lake@flatironschool.com", :password => "test")
User.create(:name => "Carlos Lazo", :email => "carlos.lazo@flatironschool.com", :password => "test")
User.create(:name => "George Lin", :email => "george.lin@flatironschool.com", :password => "test")
User.create(:name => "David Manaster", :email => "david.manaster@flatironschool.com", :password => "test")
User.create(:name => "Desmond Rawls", :email => "desmond.rawls@flatironschool.com", :password => "test")
User.create(:name => "David Rodriguez", :email => "david.rodriguez@flatironschool.com", :password => "test")
User.create(:name => "Matthew Schmaus", :email => "matthew.schmaus@flatironschool.com", :password => "test")
User.create(:name => "Sagar Shah", :email => "sagar.shah@flatironschool.com", :password => "test")
User.create(:name => "Jordan Trevino", :email => "jordan.trevino@flatironschool.com", :password => "test")
User.create(:name => "Adam Waxman", :email => "adam.waxman@flatironschool.com", :password => "test")
User.create(:name => "Ning Yap", :email => "ning.yap@flatironschool.com", :password => "test")

Role.create(:name => :instructor)
Role.create(:name => :student)

User.all.each do |user|
  user.roles << Role.where(:name => :student)
  user.save
end

user = User.find_by_email('123@abc.com')
user.roles.clear
user.roles << Role.where(:name => :instructor)
user.save

User.first.answers.create(:choice_id => 1, :quiz_id => 1, :question_id =>1)
User.first.answers.create(:choice_id => 7, :quiz_id => 1, :question_id => 2)
User.first.answers.create(:choice_id => 12, :quiz_id => 1, :question_id =>3)
User.all[1].answers.create(:choice_id => 2, :quiz_id => 1, :question_id =>1)
User.all[2].answers.create(:choice_id => 6, :quiz_id => 1, :question_id =>2)
User.all[3].answers.create(:choice_id => 11, :quiz_id => 1, :question_id =>3)

### Fake humanities quiz names

Quiz.create(:name => "Europe, An Imagined Community: Essays on Identity since 1750", :status => "completed")
Quiz.create(:name => "Lyrics of Mystical Love, East and West", :status => "active")
Quiz.create(:name => "Existentialism", :status => "pending")
Quiz.create(:name =>"The Literary 1960s: Years of Hope/Days of Rage", :status => "finalized")
Quiz.create(:name => "Postmodern Fiction and Graphic Novels", :status => "completed")
Quiz.create(:name => "Romantic Revolutions in European Music and Culture", :status => "completed")
Quiz.create(:name => "Laughter: From Aristotle to Seinfeld", :status => "completed")

Quiz.create(:name => "The Writing of the Indian Subcontinent", :status => "completed")


### Associating students to quizzes
Quiz.all.each do |quiz|
  User.all.each do |user|
    quiz.student_quizzes.create(:quiz_id => quiz.id, :user_id => user.id, :quiz_status => "pending")
  end
end

Quiz.where(:status => "active").each do |quiz|
  quiz.student_quizzes.each do |student_quiz|
    student_quiz.quiz_status = "active"
    student_quiz.save
  end
end 

Quiz.where(:status => "completed").each do |quiz|
  quiz.student_quizzes.each do |student_quiz|
    student_quiz.quiz_status = "completed"
    student_quiz.save
  end
end 




### Creating Roles

