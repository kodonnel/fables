class AddSurveyUrlToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :surveyURL, :string
  end
end
