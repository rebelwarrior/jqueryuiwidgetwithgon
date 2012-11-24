class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :thumbnail
      t.string :link

      t.timestamps
    end
  end
end
