class RemoveUseridFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :userid, :integer
  end
end
