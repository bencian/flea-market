require 'rails_helper'

RSpec.describe Backend::TagsController, type: :controller do
  describe 'Authorized user' do
    before do
      login_admin
    end

    it "should have a current_admin" do
      expect(subject.current_admin).to_not eq(nil)
    end

    describe 'GET index' do; end

    describe 'GET show' do; end

    describe 'GET new' do; end 
    
    describe 'POST create' do; end

    describe 'GET edit' do; end
    

  end

  describe 'Unauthorized user' do
    it "should have a current_admin" do
      expect(subject.current_admin).to eq(nil)
    end
  end

end
