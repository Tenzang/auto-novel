class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.text :content
      t.integer :upvotes, default: 0
      t.text :cover
      t.text :title
      t.text :blurb
      t.integer :user_id

      t.timestamps
    end
  end
end
