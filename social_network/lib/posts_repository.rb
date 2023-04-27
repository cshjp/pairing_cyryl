require_relative "./post.rb"

class PostRepository

  def all 
    posts = []
    sql = 'SELECT id, title, content, views, user_account_id FROM posts;'

    result = DatabaseConnection.exec_params(sql, [])

    result.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.title = record['title']
      post.content = record['content']
      post.views = record['views'].to_i
      post.user_account_id = record['user_account_id'].to_i
      posts << post
    end
    posts
  end

  def find(id)
    sql = 'SELECT id, title, content, views, user_account_id FROM posts WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]
    post = Post.new
    post.id = record['id'].to_i
    post.title = record['title']
    post.content = record['content']
    post.views = record['views'].to_i
    post.user_account_id = record['user_account_id'].to_i
    post
  end

  def create(post)
    sql = 'INSERT INTO posts (title, content, views, user_account_id) VALUES ($1, $2, $3, $4);'
    params = [post.title, post.content, post.views, post.user_account_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end
end


