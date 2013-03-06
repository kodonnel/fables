class FixTaggingColumnName < ActiveRecord::Migration
	def change
		rename_column	:taggings, :micropost_id, :fable_id;
	end
end
