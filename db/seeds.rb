# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:name => "Jordan", :email => "123@abc.com", :password => "test")
User.create(:name => "Sarah", :email => "sarah@abc.com",:password => "test")
User.create(:name => "David", :email => "david@abc.com",:password => "test")
User.create(:name => "Kirin", :email => "kirin@abc.com",:password => "test")


Quiz.create(:name => "Geometry")
Quiz.create(:name => "Europe, An Imagined Community: Essays on Identity since 1750", :status => "completed")
Quiz.create(:name => "Lyrics of Mystical Love, East and West", :status => "active")
Quiz.create(:name => "Existentialism", :status => "pending")
Quiz.create(:name =>"The Literary 1960s: Years of Hope/Days of Rage", :status => "finalized")
Quiz.create(:name => "Postmodern Fiction and Graphic Novels", :status => "completed")
Quiz.create(:name => "Romantic Revolutions in European Music and Culture", :status => "completed")
Quiz.create(:name => "Laughter: From Aristotle to Seinfeld", :status => "completed")

Quiz.create(:name => "The Writing of the Indian Subcontinent", :status => "completed")

Quiz.first.questions.create(:content => "How many sides in a triangle?")

Question.first.choices.create(:content => "2")
Question.first.choices.create(:content => "3", :correct => true)
Question.first.choices.create(:content => "4")
Question.first.choices.create(:content => "5")

Quiz.first.questions.create(:content => "How many sides in a rectangle?")

Question.all[1].choices.create(:content => "2")
Question.all[1].choices.create(:content => "3")
Question.all[1].choices.create(:content => "4", :correct => true)
Question.all[1].choices.create(:content => "5")

Quiz.first.questions.create(:content => "How many sides in a circle?")

Question.all[2].choices.create(:content => "0")
Question.all[2].choices.create(:content => "1")
Question.all[2].choices.create(:content => "2")
Question.all[2].choices.create(:content => "infinitely many", :correct => true)



User.first.answers.create(:choice_id => 1, :quiz_id => 1, :question_id =>1)
User.first.answers.create(:choice_id => 7, :quiz_id => 1, :question_id => 2)
User.first.answers.create(:choice_id => 12, :quiz_id => 1, :question_id =>3)
User.all[1].answers.create(:choice_id => 2, :quiz_id => 1, :question_id =>1)
User.all[2].answers.create(:choice_id => 6, :quiz_id => 1, :question_id =>2)
User.all[3].answers.create(:choice_id => 11, :quiz_id => 1, :question_id =>3)

