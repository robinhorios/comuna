class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    Category.create! name: 'Criança'
    Category.create! name: 'Adolescente'
    Category.create! name: 'Jovem'
    Category.create! name: 'Adulto'
    Category.create! name: 'Casais'
  end

  def down
  	drop_table :categories
  end
end
