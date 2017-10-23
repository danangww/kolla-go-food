# GO-FOOD - GO-SCHOLAR RoR

This application using Ruby on Rails 5.1.4. There are some important notes :

1. RoR using MVC Architecture
2. rails new go-food --> for create new ruby on rails project
3. rails server --> for starting rails server in development environment (default port : 3000)
4. rails server -e production --> for starting rails server in production environment (need some extra configurations)
5. if execjs error occurs when starting server, try to uncomment "gem 'therubyracer'" in Gemfile, then execute "bundle" and start server again.
6. rails generate --> rails command to create/generate many things such as controller, model, view, migration, etc.
7. migration files are used to generate query to create and manipulate tables
8. in rails convention, model name is singular and start with one uppercase letter followed by table name in plural and all letter in downcase. Example : model "User" followed by table "users"
9. if rails generate a model, it will create a migration file automatically
10. rails console --> enter in rails console, doing some debugging process
11. rails db:create --> for initial database creation
12. rails db:migrate --> doing migration of migration files
13. rails db:rollback --> revert last migration process 