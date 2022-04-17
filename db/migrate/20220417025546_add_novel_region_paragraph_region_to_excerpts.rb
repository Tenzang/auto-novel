class AddNovelRegionParagraphRegionToExcerpts < ActiveRecord::Migration[7.0]
  def change
    add_column :excerpts, :novel_region, :text
    add_column :excerpts, :paragraph_region, :text
  end
end
