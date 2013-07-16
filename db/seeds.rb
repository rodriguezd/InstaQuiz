# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:name => "Jordan", :email => "123@abc.com")


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

Question.all[2].choices.create(:content => "0", :correct => true)
Question.all[2].choices.create(:content => "1")
Question.all[2].choices.create(:content => "2")
Question.all[2].choices.create(:content => "3")