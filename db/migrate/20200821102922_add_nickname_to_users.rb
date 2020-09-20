class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name, :string
    add_column :users, :first_name_FURIGANA, :string
    add_column :users, :family_name_FURIGANA, :string
    add_column :users, :birth_date, :date
  end
end
