class SetPrimaryKey < ActiveRecord::Migration[5.0]
  def change
      execute "ALTER TABLE adoptions ADD PRIMARY KEY (MemberID, CatID);"
      execute "ALTER TABLE item_managers ADD PRIMARY KEY (ManagerID, ItemID);"
  end
end
