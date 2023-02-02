# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

import 'json'
import 'open-uri'

puts 'Deleting database contents, before seeding.'
Movie.destroy_all
puts "Database cleaned"

json_string = URI.open('https://tmdb.lewagon.com/movie/top_rated').read
json_hash = JSON.parse(json_string)

json_hash['results'].each do |movie|
  Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['backdrop_path']}",
    rating: movie['vote_average']
  )
end
