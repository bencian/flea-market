# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Backend::TagsController, type: :controller do
  describe 'GET index' do
    let!(:tags) { create_list(:tag, 3) }
    describe 'Authorized admin' do
      login_admin

      subject { get :index }

      it 'renders the index template' do
        subject
        expect(response).to render_template(:index)
      end

      it 'assigns the correct instance variables' do
        subject
        expect(assigns(:presenter).tags).to match_array(tags)
      end
    end

    describe 'Unauthorized admin' do
      subject { get :index }

      it 'doesnt render the index template ' do
        subject
        expect(response).to_not render_template(:index)
      end
    end
  end
  describe 'GET new' do
    describe 'Authorized admin' do
      login_admin

      subject { get :new }

      it 'renders the new template' do
        subject
        expect(response).to render_template(:new)
      end

      it 'assigns the correct instance variables' do
        subject
        expect(assigns(:tag)).to be_a_new_record
      end
    end

    describe 'Unauthorized admin' do
      subject { get :new }

      it 'doesnt render the new template ' do
        subject
        expect(response).to_not render_template(:new)
      end
    end
  end

  describe 'POST create' do
    let!(:tag_params) { { name: Faker::Name.name } }
    describe 'Authorized admin' do
      login_admin

      subject { post :create, params: { tag: tag_params } }

      it 'creates a tag' do
        expect { subject }.to change { Tag.count }.by(1)
        expect(Tag.last).to have_attributes(tag_params)
      end

      it 'redirects to tag#index' do
        subject
        expect(response).to redirect_to(tags_path)
      end
    end

    describe 'Unauthorized admin' do
      subject { post :create, params: { tag: tag_params } }

      it 'doesnt create a tag ' do
        subject
        expect { subject }.to change { Tag.count }.by(0)
      end
    end
  end

  describe 'GET edit' do
    let!(:tag) { create(:tag) }
    describe 'Authorized admin' do
      login_admin

      subject { get :edit, params: { id: tag.id} }

      it 'renders the edit template' do
        subject
        expect(response).to render_template(:edit)
      end

      it 'assigns the correct instance variables' do
        subject
        expect(assigns(:tag)).to eq(tag)
      end
    end

    describe 'Unauthorized admin' do
      subject { get :edit, params: { id: tag.id} }

      it 'doesnt create a tag ' do
        subject
        expect(response).to_not render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    let!(:tag) { create(:tag) }
    let!(:tag_params) { { name: Faker::Name.name } }
    describe 'Authorized admin' do
      login_admin
      subject { patch :update, params: { id: tag.id, tag: tag_params } }

      it 'updates a tag' do
        subject
        expect(tag.reload).to have_attributes(tag_params)
      end

      it 'redirects to tag#index' do
        subject
        expect(response).to redirect_to(tags_path)
      end
    end

    describe 'Unauthorized admin' do
      subject { put :update, params: { id: tag.id, tag: tag_params } }

      it 'doesnt updates a tag ' do
        subject
        expect(response).to_not render_template(root_path)
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:tag) { create(:tag) }
    describe 'Authorized admin' do
      login_admin
      subject { delete :destroy, params: { id: tag.id } }

      it 'destroys a tag' do
        expect { subject }.to change { Tag.count }.by(-1)
      end

      it 'redirects to tag#index' do
        subject
        expect(response).to redirect_to(tags_path)
      end
    end

    describe 'Unauthorized admin' do
      subject { delete :destroy, params: { id: tag.id } }
      
      it 'doesnt destroy a tag ' do
        subject
        expect { subject }.to change { Tag.count }.by(0)
      end
    end
  end

end
