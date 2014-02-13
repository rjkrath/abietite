require 'spec_helper'

describe DerbiesController do
  describe 'GET index' do
    let(:all_derbies) { [] }

    before { Derby.stub(:all).and_return(all_derbies) }

    it 'assigns all the derbies' do
      get :index
      expect(assigns(:derbies)).to eq(all_derbies)
    end
  end

  describe 'GET show' do
    context 'when the derby can be found' do
      let(:derby) { double('mock derby') }

      before { Derby.stub(:find_by_id).and_return(derby) }

      it 'assigns the derby variable' do
        get :show, id: 15
        expect(assigns(:derby)).to eq(derby)
      end
    end

    context 'when the derby cannot be found' do
      before { get :show, id: -1 }

      it 'flashes an error' do
        expect(flash[:error]).to be_present
      end

      it 'redirects to the index page' do
        expect(response).to redirect_to derbies_path
      end
    end
  end
end
