class RenameMicropost < ActiveRecord::Migration
	def change
		rename_table :microposts, :fables
	end
end
