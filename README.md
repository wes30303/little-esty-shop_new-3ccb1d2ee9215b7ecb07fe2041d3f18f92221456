# Little Esty Shop

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- must use Rails 5.2.x
- must use PostgreSQL
- all code must be tested via feature tests and model tests, respectively
- must use GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- must include a thorough README to describe the project
- must deploy completed code to Heroku
- Continuous Integration / Continuous Deployment is not allowed
- Any gems added to the project must be approved by an instructor

## Setup

This project requires Ruby 2.7.4.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)



<h4>Contributors: </h4>
<% @search = CommitSearch.new %>

<% @search.commit_information.each do |commit| %>
  <%= commit.name %>
  <%= commit.contributions %>
<% end %>

<%= render partial: "layouts/github2" %>

<% if  ENV["RAILS_ENV"] == "development" || ENV["RAILS_ENV"] == "production"  %>
 <h4> Repo name: <%= GitApi.make_request[:name]%></h4>
<% end %>

</body>
</html>

<footer>
<% merged_prs = MergedPrs.new %>
<% merged_prs.count.each do |user, pr_count| %>
<%= user %>'s PR count: <%= pr_count %>
<br>
<% end %>
</footer>
