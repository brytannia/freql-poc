class Add < ActiveRecord::Migration[5.2]
  def change
    create_table :users do  |t|
      t.string :username
      t.timestamps
    end

    create_table :langs do |t|
      t.string :name
    end

    create_table :project do |t|
      t.string :name
      t.string :repo_url
      t.references :main_lang
      t.timestamps
    end

    create_table :project_langs do |t|
      t.references :project
      t.references :lang
      t.timestamps
    end

    create_table :issues do |t|
      t.references :project
      t.references :lang
      t.string :desc_url
      t.integer :status
      t.string :name
      t.string :description
      t.references :publisher

      t.timestamps
    end

    create_table :bounties do |t|
      t.references :issue
      t.references :master
      t.integer :sum
      t.timestamps
    end

    create_table :currencies do |t|
      t.string :name
      t.float :rate
      t.timestamps
    end
  end
end
