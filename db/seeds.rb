# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:name => "Jordan", :email => "123@abc.com")
User.create(:name => "Sarah", :email => "sarah@abc.com")
User.create(:name => "David", :email => "david@abc.com")
User.create(:name => "Kirin", :email => "kirin@abc.com")


Quiz.create(:name => "Geometry")


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
