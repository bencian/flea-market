require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Factory' do
    context 'when a Category is created' do
      subject do
        build(:category)
      end
      it 'has a valid factory' do
        expect(subject.valid?).to be true 
      end
    end
  end

  describe 'Validations' do
    context 'presence of name' do
      before { FactoryBot.build(:category) }
      it { should validate_presence_of(:name) }
    end

    context 'uniqueness of name' do
      before { FactoryBot.build(:category) }
      it { should validate_uniqueness_of(:name) }
    end

    context 'when a Category with products gets deleted' do
      subject do
        create(:category, :with_products)
      end

      it 'is expected to fail' do
        expect(subject.destroy).to be false
      end
    end
  end
end
