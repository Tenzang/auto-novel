class AddWordCountToNovels < ActiveRecord::Migration[5.2]
  def change
    add_column :novels, :word_count, :integer
  end
end
