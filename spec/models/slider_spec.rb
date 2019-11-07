require 'rails_helper'

RSpec.describe Slider, type: :model do
  describe 'Factory' do
    context 'when a slider is created' do
      subject do
        build(:slider)
      end
      it 'has a valid factory' do
        expect(subject.valid?).to be true 
      end
    end
  end
end
