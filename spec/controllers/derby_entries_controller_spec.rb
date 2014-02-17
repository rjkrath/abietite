require 'spec_helper'

describe DerbyEntriesController do

  describe 'GET index' do
    it 'calls to find the derby' do
      Derby.should_receive(:find_by).with(id: "17").and_return(nil)

      xhr :get, :index, derby_id: 17
    end

    context 'when the derby can be found by id' do
      let(:mock_entries) { [double('entry')] }
      let(:mock_derby) { double('derby', derby_entries: mock_entries) }

      before { Derby.stub(:find_by).and_return(mock_derby) }

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

  describe 'POST create' do
    let(:current_voter) { double('mock voter') }

    before { controller.stub(:current_voter).and_return(current_voter) }

    context 'when the derby entry cannot be found' do
      before { xhr :post, :create, id: 1822 }

      it 'responds with a 422' do
        expect(response.status).to eq(422)
      end

      it 'returns a "not found" string' do
        expect(response.body).to include('not found')
      end
    end

    context 'when the derby entry can be found' do
      let(:derby_entries) { double('derby entries') }
      let(:derby_entry) { double('derby entry') }

      before do
        DerbyEntry.stub(:find_by).with(id: '128').and_return(derby_entry)
      end

      it 'tries to assign the derby entry to the voter' do
        current_voter.should_receive(:derby_entries).and_return(derby_entries)
        derby_entries.should_receive(:<<).with(derby_entry).and_return(true)

        xhr :post, :create, id: 128
      end

      context 'when the derby entry cannot be assigned to the voter' do
        before do
          current_voter.stub_chain(:derby_entries, :<<).and_return(false)
          xhr :post, :create, id: 128
        end

        it 'responds with a 422' do
          expect(response.status).to eq(422)
        end

        it 'returns a "failed" string' do
          expect(response.body).to eq('failure')
        end
      end

      context 'when the derby entry can be assigned to the voter' do
        before do
          current_voter.stub_chain(:derby_entries, :<<).and_return(true)
          xhr :post, :create, id: 128
        end

        it 'responds with a 200' do
          expect(response.status).to eq(201)
        end

        it 'returns a "success" string' do
          expect(response.body).to include('success')
        end
      end
    end
  end

  describe 'DELETE destroy' do
    let(:current_voter) { double('mock voter') }

    before { controller.stub(:current_voter).and_return(current_voter) }

    context 'when the derby entry cannot be found' do
      before { xhr :delete, :destroy, id: 1282 }

      it 'responds with a 422' do
        expect(response.status).to eq(422)
      end

      it 'returns a "not found" string' do
        expect(response.body).to include('not found')
      end
    end

    context 'when the derby entry can be found' do
      let(:derby_entries) { double('derby entries') }
      let(:derby_entry) { double('derby entry') }

      before do
        DerbyEntry.stub(:find_by).with(id: '138').and_return(derby_entry)
      end

      it 'removes that derby entry from the voter' do
        current_voter.should_receive(:derby_entries).and_return(derby_entries)
        derby_entries.should_receive(:destroy).with(derby_entry)

        xhr :delete, :destroy, id: 138
      end

      context 'when the derby entry can be assigned to the voter' do
        before do
          current_voter.stub_chain(:derby_entries, :destroy)
          xhr :delete, :destroy, id: 138
        end

        it 'responds with a 200' do
          expect(response.status).to eq(200)
        end

        it 'returns a "success" string' do
          expect(response.body).to include('success')
        end
      end
    end
  end
end
