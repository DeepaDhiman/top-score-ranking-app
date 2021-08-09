# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

players = [
  {
    "name": "PlayerX",
    "scores": [
      {
        "score": 20,
        "time": "2020/12/01"
      },
      {
        "score": 19,
        "time": "2020/11/02"
      },
      {
        "score": 50,
        "time": "2020/10/01"
      }
    ]
  },
  {
    "name": "PlayerY",
    "scores": [
      {
        "score": 0,
        "time": "2020/12/01"
      },
      {
        "score": 5,
        "time": "2020/09/01"
      },
      {
        "score": 60,
        "time": "2020/10/01"
      }
    ]
  },
  {
    "name": "PlayerZ",
    "scores": [
      {
        "score": 80,
        "time": "2020/11/02"
      },
      {
        "score": 9,
        "time": "2020/03/29"
      },
      {
        "score": 10,
        "time": "2021/03/15"
      }
    ]
  },
  {
    "name": "PlayerA",
    "scores": [
      {
        "score": 60,
        "time": "2020/11/02"
      },
      {
        "score": 29,
        "time": "2020/10/29"
      },
      {
        "score": 68,
        "time": "2020/06/25"
      }
    ]
  },
  {
    "name": "PlayerB",
    "scores": [
      {
        "score": 5,
        "time": "2020/12/01"
      },
      {
        "score": 0,
        "time": "2020/09/01"
      },
      {
        "score": 9,
        "time": "2021/01/15"
      }
    ]
  }
]

players.each do |player|
  new_player = Player.create(
    name: player[:name].downcase
  )
  
  player[:scores].each do |score|
    new_player.scores.create(
      score: score[:score],
      time: score[:time]
    )
  end
end