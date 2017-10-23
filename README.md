# GO-FOOD - GO-SCHOLAR RoR

Simplified GO-FOOD application based on website using Ruby on Rails. One of many projects in GO-SCHOLAR Ruby on Rails class. (Oct-Dec 2017)

## Important Notes

This application using Ruby on Rails 5.1.4 on Linux Ubuntu 16.04 (Xenial). There are some important notes :

* RoR using MVC Architecture
* Creating new ruby on rails project, run this command:
``` rails new go-food ```
* Starting rails server in development environment (default port : 3000), run this command:
``` rails server ```
* Starting rails server in production environment (need some extra configurations), run this command:
rails server -e production
* If execjs error occurs when starting server, try to uncomment "gem 'therubyracer'" in Gemfile, 
then execute ```bundle``` and start server again.
* Rails command to create/generate many things such as controller, model, view, migration, etc:
``` rails generate ... ```
* Migration files are used to generate query to create and manipulate tables
* In rails convention, model name is singular and start with one uppercase letter followed by table name in plural and all letter in downcase. Example : model *User* followed by table *users*
* If rails generate a model, it will create a migration file automatically
* Enter in rails console, doing some debugging process:
``` rails console ```
* For initial database creation
``` rails db:create ```
* Doing database migration of migration files
``` rails db:migrate ```
* Revert/undo last migration process
``` rails db:rollback ```

## Complete Documentation for Ruby on Rails

* [Ruby-Doc.org](http://ruby-doc.org) - Ruby-Doc.org: Documenting the Ruby Language
* [RoR Guide](https://guides.rubyonrails.org) - Ruby on Rails guide