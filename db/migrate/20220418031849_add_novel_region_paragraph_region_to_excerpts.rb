class AddNovelRegionParagraphRegionToExcerpts < ActiveRecord::Migration[5.2]
  def change
    add_column :excerpts, :novel_region, :text
    add_column :excerpts, :paragraph_region, :text
  end
end
