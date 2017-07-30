class FaqController < ApplicationController
  def index
    faq_block = {
      '1' => '專業小型車床',
      '2' => '專業小型銑床',
      '3' => '桌上型車床',
      '4' => '桌上型銑床',
      '5' => '光學尺/線性尺',
      '6' => '鑽頭研磨機',
      '7' => '銑刀研磨機',
      '8' => '業界唯一推薦'
    }
    faq_block.each do |position_index, category_name|
      instance_variable_set(
        '@position'+ position_index, FaqCategory.find_by_title(category_name).id
      )
    end
  end
  def faq_category
    category_id = params[:category_id]
    @category_id = FaqCategory.find_by_category_id(category_id)
  end
  def faq_example
  end
end
