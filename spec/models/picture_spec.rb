require 'rails_helper'

RSpec.describe Picture, type: :model do
  subject(:picture) { create(:picture) }
  describe '#create' do
    it 'should not raise any error' do
      expect{subject}.not_to raise_error
    end
  end
end
