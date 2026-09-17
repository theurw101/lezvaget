class CreateCustomWords < ActiveRecord::Migration[8.1]
  def change
    create_table :custom_words do |t|
      t.string :word
      t.string :status
      t.string :added_by

      t.timestamps
    end
  end
end
