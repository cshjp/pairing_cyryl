require "posts_repository"

describe PostRepository do

  def reset_posts_table
    seed_sql = File.read('spec/seeds_useraccounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_posts_table
  end

  it 'returns the first post when calling all method' do
    repo = PostRepository.new
    post = repo.all
    expect(post.length).to eq 2
    expect(post[0].id).to eq 1
    expect(post[0].title).to eq 'title'
    expect(post[0].content).to eq 'content'
    expect(post[0].views).to eq 5
    expect(post[0].user_account_id).to eq 1
  end

  it 'finds specified post' do
    repo = PostRepository.new
    post = repo.find(1)
    expect(post.id).to eq 1
    expect(post.title).to eq 'title'
    expect(post.content).to eq 'content'
    expect(post.views).to eq 5
    expect(post.user_account_id).to eq 1
  end

  it "creates new post" do
    repo = PostRepository.new
    post = Post.new
    post.title = "ode to onions"
    post.content = "like orges onions have layers, just like no one really knows an onions deepest layer, no one understands me"
    post.views = 1003
    post.user_account_id = 2
    posts = repo.create(post)
    all_posts = repo.all
    expect(all_posts).to include(
      have_attributes(
        title: post.title,
        content: post.content,
        views: post.views
      )
    )
  end

  it "deletes post" do
    repo = PostRepository.new
    repo.delete(1)
    expect(repo.all.length).to eq 1
  end
end