# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    I used the Sinatra gem
- [x] Use ActiveRecord for storing information in a database
    I used the ActiveRecord gem
- [x] Include more than one model class (e.g. User, Post, Category)
    I have four models, (including a join model)
        - Department
        - Item
        - UserDepartment
        - User
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    I used two:
        - has_many :departments, through: :user_departments
        - has_many :user_departments
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    I used three total, one on my Item model which belongs to a department and two on my join model.
- [x] Include user accounts with unique login attribute (username or email)
    I validate the uniqueness of username with ActiveRecord
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    I my Items, Departments, and Users all have all four of the routes.
- [x] Ensure that users can't modify content created by other users
    Users can only modify content that they have permission to edit.
- [x] Include user input validations
    I validate that item names, department names, and usernames are all unique
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    I have flash[:error] messages to inform the user when they have tried to access a restricted route and when they have violated a validation.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    My README.md has all of this.

Confirm
- [x] You have a large number of small Git commits
    I have over 100 commits, most of which are small.
- [x] Your commit messages are meaningful
    My messages describe what the committed code is for
- [x] You made the changes in a commit that relate to the commit message
    My commit messages are related to the changes in the commit.
- [x] You don't include changes in a commit that aren't related to the commit message
    I probably have some random changes thrown in to some of the commits but for the most part I have followed this.