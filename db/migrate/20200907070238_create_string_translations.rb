class CreateStringTranslations < ActiveRecord::Migration[6.0]

  # Ref issue:
  #           https://github.com/shioyama/mobility/issues/110
  # Ref MariaDB - innodb the maximum index key length:
  #           https://mariadb.com/kb/en/innodb-limitations/#page-sizes
  def change
    create_table :mobility_string_translations do |t|
      t.string :locale, null: false, limit: 15 # NEW limit option
      t.string :key, null: false, limit: 243   # NEW limit option
      t.string :value
      t.references :translatable, polymorphic: true, index: false
      t.timestamps null: false
    end
    add_index :mobility_string_translations, [:translatable_id, :translatable_type, :locale, :key], unique: true, name: :index_mobility_string_translations_on_keys
    add_index :mobility_string_translations, [:translatable_id, :translatable_type, :key], name: :index_mobility_string_translations_on_translatable_attribute
    add_index :mobility_string_translations, [:translatable_type, :key, :value, :locale], name: :index_mobility_string_translations_on_query_keys
  end
end
