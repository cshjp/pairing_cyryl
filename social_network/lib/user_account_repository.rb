require_relative "./user_account"

class UserAccountRepository
  def all
    sql = "SELECT id, email_address, username FROM user_accounts;"
    user_accounts = []
    result = DatabaseConnection.exec_params(sql, [])

    result.each do |record|
      user_account = UserAccount.new
      user_account.id = record["id"].to_i
      user_account.email_address = record["email_address"]
      user_account.username = record["username"]
      user_accounts << user_account
    end
    user_accounts
  end

  def find(id)
    sql = "SELECT id, email_address, username FROM user_accounts WHERE id = $1;"
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]
    user_account = UserAccount.new
    user_account.id = record["id"].to_i
    user_account.email_address = record["email_address"]
    user_account.username = record["username"]
    user_account
  end

  def create(user_account)
    sql = "INSERT INTO user_accounts (email_address, username) VALUES ($1, $2);"
    params = [user_account.email_address, user_account.username]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = "DELETE FROM user_accounts WHERE id = $1;"
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end
end
