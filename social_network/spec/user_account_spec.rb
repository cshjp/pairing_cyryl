require "user_account_repository"

RSpec.describe UserAccountRepository do
  def reset_user_accounts_table
    seed_sql = File.read("spec/seeds_useraccounts.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "social_network_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_user_accounts_table
  end

  it "returns all user accounts" do
    repo = UserAccountRepository.new

    user_accounts = repo.all

    expect(user_accounts.length).to eq 2
    expect(user_accounts[0].id).to eq 1
    expect(user_accounts[0].email_address).to eq "cg@makers"
    expect(user_accounts[0].username).to eq "CyrylG"
    expect(user_accounts[1].id).to eq 2
    expect(user_accounts[1].email_address).to eq "cp@makers"
    expect(user_accounts[1].username).to eq "cshjp"
  end

  it "find first user" do
    repo = UserAccountRepository.new

    user_account = repo.find(1)

    expect(user_account.id).to eq 1
    expect(user_account.email_address).to eq "cg@makers"
    expect(user_account.username).to eq "CyrylG"
  end

  it "creates new user" do
    repo = UserAccountRepository.new
    new_user = UserAccount.new
    new_user.email_address = "shrek@swamp"
    new_user.username = "xzx_FionaSaver_xzx"
    user_account = repo.create(new_user)
    all_users = repo.all
    expect(all_users).to include(
      have_attributes(
        email_address: new_user.email_address,
        username: new_user.username,
      )
    )
  end

  it "deletes second user" do
    repo = UserAccountRepository.new

    repo.delete(2)
    expect(repo.all.length).to eq 1
  end
end
