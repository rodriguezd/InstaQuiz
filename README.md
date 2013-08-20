#Welcome to InstaQuiz! 

InstaQuiz is a collaborative quiz application where students create the questions and instructors evaluate progress and comprehension. 

##Versions / Database

- Ruby 1.9.3
- Rails 3.2
- SQLite3 database

##Setting Up InstaQuiz

1. Clone the Repo
2. Run `bundle install` in terminal.
3. Run `rake db:migrate` in terminal. 
3. Run `rake db:seed` in terminal. 
Note: Currently the `database.yml` file is configured for sqlite3

##Registration and Getting Started

URL for development environment: `http://localhost:3000`


1. Click on "Sign Up" from the landing page, fill out the form for registration, and select the instructor role. 
2. Sign in and select "My Groups" from the navigation bar and create at least one group. Once the group is created, the code provided must be used by students to join that group.
3. Click on "Create Quiz" from the nav bar and create a quiz. (Quiz will now apear under pending tab of the dashboard.)
4. Once a quiz is created you may add questions and registered students can add questions as well. 


<!-- ##Setting up Email
 -->


##About us
Created by Summer 2013 [Flatiron School](http://flatironschool.com/), students [David Rodriguez](https://github.com/rodriguezd), [Jordan Trevino](https://github.com/jgtr), [Kirin Masood](https://github.com/kirinm1), [Sarah Duve](https://github.com/sarahduve).