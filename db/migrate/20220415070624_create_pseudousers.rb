class CreatePseudousers < ActiveRecord::Migration[7.0]
  def change
    create_table :pseudousers do |t|
      t.string :user_id

      t.timestamps
    end
  end
end