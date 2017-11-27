class AddAttrToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures , :name , :string
    add_column :pictures , :sex , :string
  end
end
