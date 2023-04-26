require 'album_repository'

describe AlbumsRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_albums_table
  end

  it 'returns one album' do
    repo = AlbumsRepository.new
    albums = repo.all
    expect(albums.length).to eq 1 # =>  1
    expect(albums.first.title).to eq "Neotheater" # =>  'Neotheater'
    expect(albums.first.release_year).to eq '2019' # =>  '2019'
    expect(albums.first.artist_id).to eq '1' # =>  1
  end
end