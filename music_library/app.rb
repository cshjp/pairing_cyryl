require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
result = AlbumsRepository.new
album_repository = AlbumsRepository.new
# Print out each record from the result set .
result.all.each do |record|
  p "#{record.title} - #{record.release_year}"
end

album = album_repository.find(3)

puts album.id
puts album.title
puts album.release_year
puts album.artist_id