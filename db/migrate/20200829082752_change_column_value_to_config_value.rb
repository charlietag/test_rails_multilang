class ChangeColumnValueToConfigValue < ActiveRecord::Migration[6.0]
  def change
    rename_column :configs, :value, :config_value
  end
end
