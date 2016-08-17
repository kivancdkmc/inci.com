class CreatePlacesTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :places, :tags
    end
end
