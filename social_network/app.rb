require_relative 'lib/database_connection'
require_relative 'lib/user_account_repository'
require_relative 'lib/posts_repository'

DatabaseConnection.connect('social_network')

user_create = UserAccountRepository.new
new_user = UserAccount.new
new_user.email_address = "shrek@swamp"
new_user.username = "xzx_FionaSaver_xzx"
user_create.create(new_user)

repo_all = UserAccountRepository.new
repo_all.all.each do |record|
  p "#{record.username}, #{record.email_address}"
end

posts_all = PostRepository.new
posts_all.all.each do |record|
  p "#{record.title}, #{record.content}. Views: #{record.views}, By: #{record.user_account_id}"
end

posts_find = PostRepository.new
p posts_find.find(1)

user_delete = UserAccountRepository.new
user_delete.delete(3)


