class FixColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :translations, :anwser, :answer
  end
end
