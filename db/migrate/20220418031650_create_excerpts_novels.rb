class CreateExcerptsNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :excerpts_novels, :id => false do |t|
      t.integer :excerpt_id
      t.integer :novel_id
    end
  end
end
