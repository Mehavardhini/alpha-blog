class AddUseridToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :userid, :integer
  end
end
