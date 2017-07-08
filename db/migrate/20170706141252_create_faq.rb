class CreateFaq < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :title
      t.string :description
      t.references :faq_category, index: true
      t.timestamps
    end
  end
end
