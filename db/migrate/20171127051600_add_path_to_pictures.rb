class AddPathToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures , :path , :string
  end
end
