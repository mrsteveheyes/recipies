class AddFamilyToUsers < ActiveRecord::Migration[7.2]
  def up
    # First add the column as nullable
    add_reference :users, :family, null: true, foreign_key: true

    # Create a default family for existing users
    default_family = Family.create!(name: 'Default Family')

    # Update all existing users to belong to the default family
    User.update_all(family_id: default_family.id)

    # Now make the column non-nullable
    change_column_null :users, :family_id, false
  end

  def down
    remove_reference :users, :family
  end
end
