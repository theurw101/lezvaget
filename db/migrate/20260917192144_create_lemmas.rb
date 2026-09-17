class CreateLemmas < ActiveRecord::Migration[8.1]
  def change
    create_table :lemmas do |t|
      t.string :word
      t.string :part_of_speech
      t.string :conjugation_class

      t.timestamps
    end
  end
end
