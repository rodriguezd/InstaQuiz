class UserMailer < ActionMailer::Base
  default :from => "davidrodriguez212@gmail.com"

  def take_quiz_email(user, quiz)
    @user = user
    @quiz = quiz
    mail(:to => user, :subject => "Go take a quiz")
  end

  # def take_quiz_email(user, quiz)
  #   @user = user
  #   @quiz = quiz
  #   mail(:to => "#{user.name} <#{user.email}>", :subject => "Go take a quiz")
  # end

  def submit_questions_email(user, quiz)
    @user = user
    @quiz = quiz
    mail(:to => user, :subject => "Submit questions for a quiz")
  end
end
