# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# seeds.rb

# Destroy all existing records to avoid duplication or conflicts
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

# Create movies
movies_data = [
  # ... (your movie data here, as you've provided)
  {title: "Wonder Woman 1984",
    overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
    poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
    rating: 6.9},
  {title: "The Shawshank Redemption",
    overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
    poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
    rating: 8.7},
  {title: "Titanic",
    overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
    poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
    rating: 7.9},
  {title: "Ocean's Eight",
    overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.',
    poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
    rating: 7.0}
]

created_movies = []

movies_data.each do |movie_data|
  movie = Movie.create!(movie_data)
  created_movies << movie
  puts "Created #{movie.title}"
end

# Create lists
lists_data = ["Action", "Drama", "Romance", "Heist"]
created_lists = []

lists_data.each do |list_name|
  list = List.create!(name: list_name)
  created_lists << list
  puts "Created list: #{list.name}"
end

# Create bookmarks linking movies to lists with comments
# For simplicity, let's associate each movie with every list and add a generic comment.
created_movies.each do |movie|
  created_lists.each do |list|
    bookmark = Bookmark.create!(
      comment: "This movie is a great example of the #{list.name} genre.",
      movie_id: movie.id,
      list_id: list.id
    )
    puts "Added #{movie.title} to #{list.name}"
  end
end




# Movie.destroy_all

# movies_data = [
#   {title: "Wonder Woman 1984",
#     overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
#     poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
#     rating: 6.9},
#   {title: "The Shawshank Redemption",
#     overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
#     poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
#     rating: 8.7},
#   {title: "Titanic",
#     overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
#     poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
#     rating: 7.9},
#   {title: "Ocean's Eight",
#     overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.',
#     poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
#     rating: 7.0}]

#     movies_data.each do |movie_data|
#       movie = Movie.create!(movie_data)
#       puts "Created #{movie.title}"
#     end


#     # movies_data.each do |movie_data|
#     #   movie = Movie.create!(
#     #     title: movie_data[:title],
#     #     overview: movie_data[:overview],
#     #     poster_url: movie_data[:poster_url],
#     #     rating: movie_data[:rating])
