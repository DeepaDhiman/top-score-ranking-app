json.array! @search_result do |data|
  json.id data.id
  json.score data.score
  json.score_date data.time.strftime('%Y-%m-%d')
  json.player_name data.name
end