require 'spec_helper'

describe DerbyEntriesController do

  describe 'GET index' do
    it 'calls to find the derby' do
      Derby.should_receive(:where).with(id: "17").and_return([])

      xhr :get, :index, derby_id: 17
    end

    context 'when the derby can be found by id' do
      let(:mock_entries) { [double('entry')] }
      let(:mock_derby) { double('derby', derby_entries: mock_entries) }

      before { Derby.stub(:where).and_return([mock_derby]) }

      it 'assigns found derby entries' do
        xhr :get, :index, derby_id: 17

        expect(assigns(:derby_entries)).to eq(mock_entries)
      end
    end

    context 'when the derby cannot be found by id' do
      it 'assigns an empty array' do
        xhr :get, :index, derby_id: 7711

        expect(assigns(:derby_entries)).to eq([])
      end
    end
  end
end
