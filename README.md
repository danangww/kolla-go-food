# GO-FOOD - GO-SCHOLAR RoR

Simplified GO-FOOD application based on website using Ruby on Rails. One of many projects in GO-SCHOLAR Ruby on Rails class. (Oct-Dec 2017)

## Important Notes

This application using Ruby on Rails 5.1.4 on Linux Ubuntu 16.04 (Xenial). There are some important notes :

* RoR using MVC Architecture
* ```rails new go-food``` -> Creating new ruby on rails project named *go-food*
* ```rails server``` -> starting rails server in development environment (default port : 3000)
* ```rails server -e production``` -> starting rails server in production environment (will need some extra configurations)
* If *execjs error* occurs when starting server, try to uncomment **gem 'therubyracer'** in Gemfile, 
then execute ```bundle``` and start server again.
* ```rails generate ...``` -> rails command to create/generate many things such as controller, model, view, migration, etc. for example ```rails generate controller home hello``` will create a controller named *home_controller* with action method *hello*
* Migration files are used to generate query to create and manipulate tables
* In rails convention, model name is singular and start with one uppercase letter followed by table name in plural and all letter in downcase. Example : model *User* followed by table *users*
* If rails generate a model, it will create a migration file automatically
* ```rails console``` -> enter in rails console, doing some debugging process:
* ```rails db:create``` -> for initial database creation
* ```rails db:migrate``` -> doing database migration of migration files
* ```rails db:rollback``` -> Revert/undo last migration process
* ```<% something %>``` -> process something without display it to the screen, i.e : *if*, *each*, etc
* ```<%= something %>``` -> display it to the screen, i.e : display a variable

## Complete Documentation for Ruby on Rails

* [Ruby-Doc.org](http://ruby-doc.org) - Ruby-Doc.org: Documenting the Ruby Language
* [RoR Guide](http://guides.rubyonrails.org) - Ruby on Rails guide