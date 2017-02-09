class CreateDocuments < ActiveRecord::Migration
  def change
    enable_extension "hstore"

    create_table :documents do |t|
      t.integer :type_id
      t.string  :content

      t.timestamps
    end
  end
end
