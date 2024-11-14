class CreateTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :translations do |t|
      t.text :question
      t.text :anwser
      t.integer :search_count

      t.timestamps
    end
  end
end
