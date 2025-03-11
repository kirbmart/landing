class CreateLeads < ActiveRecord::Migration[8.0]
  def change
    create_table :leads do |t|
      t.string :email, null: false
      t.string :company_name
      t.string :user_type
      t.string :ip_address
      t.string :utm_source
      t.string :utm_medium
      t.string :utm_campaign
      t.string :utm_term
      t.string :utm_content

      t.timestamps
    end
    
    add_index :leads, :email, unique: true
  end
end
