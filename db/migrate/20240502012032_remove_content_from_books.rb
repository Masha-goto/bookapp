class RemoveContentFromBooks < ActiveRecord::Migration[6.0]
  def up
		remove_column :books, :content
  end

  def down
		add_column :books, :content, :text
  end
end
