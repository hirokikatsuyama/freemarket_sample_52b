class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string  :uid
      t.string  :provider
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
