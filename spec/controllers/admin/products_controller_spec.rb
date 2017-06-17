require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :request do
  include PictureUploaderExample
  let(:params) { ActionController::Parameters.new(product.merge(pictures)) }
  describe 'POST #create' do
    before(:each) do
      sign_in create(:user)
    end
    after(:all) do
      remove_pictures
    end
    let(:product) { build(:product).serializable_hash }
    let(:pictures) do
      create_pictures(5).each_with_index.map do |picture, index|
        [index.to_s, Rack::Test::UploadedFile.new(picture, 'image/png')]
      end.to_h
    end
    let(:params_with_image) do
      result = product
      result['pictures'] = pictures
      result
    end
    let!(:request) { post '/admin/products', product: params_with_image }
    subject { Product.where(sku: product['sku']).first }
    it 'respones result should be ok' do
      expect(request.status).to eq 302
    end
    it 'creates a new product' do
      expect(subject.sku).to eq(product['sku'])
    end
    context 'when uploads product_detail' do
      let(:product_detail) { build(:product_detail).serializable_hash }
      let(:params_with_product_detail) do
        result = product
        result['product_detail'] = product_detail
        result
      end
      let!(:request) do
        post '/admin/products', product: params_with_product_detail
      end
      it 'should saved the product spec' do
        expect(subject.product_detail.maximum_diameter_grab_items)
          .to eq product_detail['maximum_diameter_grab_items']
      end
    end
    context 'when uploads batch of images' do
      let!(:request) do
        post '/admin/products', product: params_with_image
      end
      it 'retruns a batch of images belongs to product' do
        expect(subject.pictures.count).to be(5)
      end
    end
  end
end
