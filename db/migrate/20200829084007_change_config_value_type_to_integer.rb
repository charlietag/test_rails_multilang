class ChangeConfigValueTypeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :configs, :config_value, :integer
  end
end
