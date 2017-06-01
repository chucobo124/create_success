require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { create(:product) }
  it 'should not return any error' do
    expect { subject }.not_to raise_error
  end
  RSpec.shared_examples 'check has many feature' do |expected_column|
    let(:item_number) { 5 }
    let(:many_products) { create_list(:product, item_number) }
    subject do
      subject_product = product
      subject_product.send(expected_column.to_sym) << many_products
      subject_product.save!
      Product.find(product.id).send(expected_column.to_sym).count
    end
    it 'should returns many standard_accessories' do
      expect(subject).to eq item_number
    end
  end
  include_examples 'check has many feature', 'standard_accessories'
  include_examples 'check has many feature', 'optional_accessories'
end
