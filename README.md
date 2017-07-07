# Miles of Smiles (Week 2 Rails Project)

#### By Jonathon Kang

## Description

Uses Rails and Devise to practice user authentication setup on a fake commerce site. Users are authenticated through Devise and site privileges change based on whether the user is currently logged in and their current admin status.

## Prerequisites
* Rails
* Devise gem
* PostgreSQL

## Setup/Installation Requirements
1. Clone the directory to your local machine and navigate to project root directory.
2. Run $ bundle to install necessary gems.
3. Run $ rake db:create and $ rake db:migrate to initialize the database.
4. Run $ rails server to start the app and navigate toe localhost:3000 in a browser.
5. Create an account to navigate user features or sign into 'admin@admin.com'///123456 to navigate admin features.

## Technologies Used
* HTML/CSS
* Bootstrap
* Ruby
* Rails
* PostgreSQL

## Known Bugs
* Spec tests accounting for deleting products is failing, capybara won't select the correct option from the alert confirmation.

## Future Updates
* Add categories navigation to drop down in the navbar.
* Convert categories and products into a many-to-many association.
* Add additional user functionality, sales, favorites list, etc.

### License
MIT
