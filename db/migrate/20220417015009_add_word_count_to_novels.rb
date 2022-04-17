class AddWordCountToNovels < ActiveRecord::Migration[7.0]
  def change
    add_column :novels, :word_count, :integer
  end
end
