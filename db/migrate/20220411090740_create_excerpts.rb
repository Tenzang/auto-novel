class CreateExcerpts < ActiveRecord::Migration[7.0]
  def change
    create_table :excerpts do |t|
      t.text :content
      t.integer :length
      t.integer :user_id

      t.timestamps
    end
  end
end