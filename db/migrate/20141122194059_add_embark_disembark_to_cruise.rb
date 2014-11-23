class AddEmbarkDisembarkToCruise < ActiveRecord::Migration
  def change
    add_reference :cruises, :embark, index: true
    add_reference :cruises, :disembark, index: true
  end
end
