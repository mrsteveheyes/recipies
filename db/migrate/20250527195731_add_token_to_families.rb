class AddTokenToFamilies < ActiveRecord::Migration[7.2]
  def change
    add_column :families, :token, :string
    add_index :families, :token, unique: true
  end
end
