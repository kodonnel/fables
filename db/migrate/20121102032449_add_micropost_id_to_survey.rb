class AddMicropostIdToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :micropost_id, :integer
  end
end
