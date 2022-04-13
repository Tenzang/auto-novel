class CreateNovels < ActiveRecord::Migration[7.0]
  def change
    create_table :novels do |t|
      t.text :content
      t.integer :upvotes
      t.text :cover
      t.text :title
      t.text :blurb
      t.integer :user_id

      t.timestamps
    end
  end
end
