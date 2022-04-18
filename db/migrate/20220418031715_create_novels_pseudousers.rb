class CreateNovelsPseudousers < ActiveRecord::Migration[5.2]
  def change
    create_table :novels_pseudousers, :id => false do |t|
      t.integer :novel_id
      t.integer :pseudouser_id
    end
  end
end
