class CreateNovelsPseudousers < ActiveRecord::Migration[7.0]
  def change
    create_table :novels_pseudousers, :id => false do |t|
      t.integer :novel_id
      t.integer :pseudouser_id
    end
  end
end
