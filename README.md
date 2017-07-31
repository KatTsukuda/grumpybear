# Grumpy Bear
![Grumpy Bear](https://grumpybear.herokuapp.com/assets/grumpybear-62a9eb9dab3af1323fa016d4d3ec95657b6089d95e80eb56dfd3f0eaa63733e6.png "Grumpy Bear")

Reference-style: 
Campaign builder platform for progressive organizations to mobilize for action.


[Grumpy Bear on Heroku](https://grumpybear.herokuapp.com/)


## Technologies

* Ruby
* Rails
* PostgreSQL
* HTML
* CSS / SASS

### Gems
* Bcrypt - Secure Login
* Bootstrap - Style!
* CarrierWave - Image Uploads!
* Friendly_Id - Vanity URLs!
* jQuery-Rails - jQuery!
* SearchKick - Searches!
* Will_Paginate - Pagination!


## Existing Features

* Sign up & Sign in
  * Secure account creation with Bcrypt!
  * Strict params for password creation.
  * Only signed in users can Create, Edit/Update, & Destroy their own campaigns and profile.
  * See join date.
* Taking Action
  * Non-users can view campaigns and sign a petition.
  * Anyone can search through the index of campaigns for keywords associated with an organization's name, a campaign and campaign category.
* Campaign stats!
  * Users can export a CSV file for each of campaign from their profile page.
  * Campaign data includes the basic contact information of each campaign signer.
* Flash messages and form helpers!
  * Friendly flash messages, notations, and jQuery word counters are used on forms to notate special conditions.


## Grumpy Bear Wishlist Features

* More sophisticated search options and sorting.
  * Allow site visitors and users to search and sort by an organization's name, a campaign's category, geographic location, and/or a campaign's recency and popularity.
* A gallery of templates for users to choose from and customize!
* Add a WYSIWYG editor for campaigns.
* Advanced targeting for campaigns.
  * Enable users to select more than one target for a campaign and have pre-populated contact information for government bodies and officials.
* Add rating key values to post model for users to rank different aspects of their travel experience.
* A/B tests for campaigns!
  * Allow users to set up split tests for campaigns to optimize campaign conversions.
* More sophisticated data collection and synching to a organization's CRM!
* More social share features for action takers to share the campaign through other channels.
* Post-action email
  * Enable user to set up and send post-action emails via Grumpy Bear.
