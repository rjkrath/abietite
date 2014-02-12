require 'spec_helper'

describe Scrapers::DerbyEntry do

  describe '#find_or_create' do
    let(:web_vote_node) { double('mock vote node') }
    let(:web_entry_node) { double('mock entry node', at: web_vote_node) }
    let(:node_data) { {} }
    let(:derby_entry_node) { double('mock derby entry', extract_data: node_data) }

    before { Nodes::DerbyEntry.stub(:new).and_return(derby_entry_node) }

    it 'creates a new derby entry node' do
      Nodes::DerbyEntry.should_receive(:new).with(web_vote_node).and_return(derby_entry_node)

      Scrapers::DerbyEntry.find_or_create(web_entry_node)
    end

    it 'extracts data from the derby entry node' do
      derby_entry_node.should_receive(:extract_data).and_return({})

      Scrapers::DerbyEntry.find_or_create(web_entry_node)
    end

    context 'when there is no existing derby entry' do
      let(:node_data) { { entry_id: 8172712 } }
      let(:new_derby_entry) { double('new derby entry') }

      it 'calls to create a derby entry' do
        ::DerbyEntry.should_receive(:create).with(instance_of(Hash)).and_return(new_derby_entry)

        Scrapers::DerbyEntry.find_or_create(web_entry_node)
      end

      it 'returns the newly created derby entry' do
        ::DerbyEntry.stub(:create).and_return(new_derby_entry)
        result = Scrapers::DerbyEntry.find_or_create(web_entry_node)

        expect(result).to eq(new_derby_entry)
      end
    end

    context 'when there is an existing derby entry' do
      let(:node_data) { {entry_id: 1872 } }
      let(:existing_derby_entry) { double('existing derby entry') }

      it 'finds the derby entry' do
        ::DerbyEntry.should_receive(:where).with(entry_id: 1872).and_return([existing_derby_entry])
        Scrapers::DerbyEntry.find_or_create(web_entry_node)
      end

      it 'returns the found derby entry' do
        ::DerbyEntry.stub(:where).and_return([existing_derby_entry])

        result = Scrapers::DerbyEntry.find_or_create(web_entry_node)
        expect(result).to eq(existing_derby_entry)
      end
    end
  end
end
