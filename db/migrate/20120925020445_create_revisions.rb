class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.text :content
      t.references :post

      t.timestamps
    end
    add_index :revisions, :post_id
  end
end
