class ChangeDataStringToItems < ActiveRecord::Migration[5.2]
  def change
    change_column  :items,:detail, :text
  end
end
