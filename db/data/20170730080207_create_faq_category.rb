class CreateFaqCategory < SeedMigration::Migration
  def up
    ['專業小型車床', '專業小型銑床', '桌上型車床', '桌上型銑床', '光學尺/線性尺',
     '鑽頭研磨機', '銑刀研磨機', '業界唯一推薦'].each do |faq_category|
       FaqCategory.create(title: faq_category)
    end
  end

  def down
    ['專業小型車床', '專業小型銑床', '桌上型車床', '桌上型銑床', '光學尺/線性尺',
     '鑽頭研磨機', '銑刀研磨機', '業界唯一推薦'].each do |faq_category|
       FaqCategory.find_by_title(faq_category).destroy
    end
  end
end
