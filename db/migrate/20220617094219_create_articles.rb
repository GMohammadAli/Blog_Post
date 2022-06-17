class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.text :domain
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
