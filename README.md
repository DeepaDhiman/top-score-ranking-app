Top Score Ranking
===================
A Top Score Ranking to keep track of the players ranking, results an overall listing of players information. Built with Rails.

```
Key functionality includes the ability to:
- Score filters of player and ther History Tab
- Listing of all scroes of Player
- Show Player History Tab
```

Setup:
-------
```
git clone https://github.com/DeepaDhiman/top-score-ranking-app.git
bundle
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
bin/rails s

#to run tests
rspec
```

Technologies Used:
-------
```
- [Ruby On Rails](http://rubyonrails.org/)
- Tested using [RSpec](http://rspec.info/)
- [Vuejs] (https://vuejs.org/)
```

Postman Details:
-------
- Public Link for Postman Collection (https://www.getpostman.com/collections/3dc720734b9c4e4fbac1)

Improvements & known defects:
-------
- Pagination Design is not proper
- Code Refactoring on Vue Js side


Screenshots:
-------
Sample - Laptop Resolution (Home Screen)

![web](git_imgs/screen_1.png)

Sample - Laptop Resolution (Search using multiple players)

![web](git_imgs/screen_2.png)

Sample - Laptop Resolution (Show list all players scroes)

![web](git_imgs/screen_3.png)

* Note: If you don't pass any values it will return all records

Sample - Laptop Resolution (Players History Tab)

![web](git_imgs/screen_4.png)