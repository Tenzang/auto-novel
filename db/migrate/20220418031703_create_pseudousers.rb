class CreatePseudousers < ActiveRecord::Migration[5.2]
  def change
    create_table :pseudousers do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
