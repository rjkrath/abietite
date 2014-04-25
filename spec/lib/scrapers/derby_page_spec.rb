require 'spec_helper'

describe Scrapers::DerbyPage do
  let(:scraper) { described_class.new }
  #
  #let(:mock_document) { double('mock document') }
  #let(:mock_links) { [double('link node')] }
  #let(:mock_status) { double('status node') }
  #let(:mock_entries) { [] }
  #
  #let(:mock_page_node) { double('derby page node', derby_id: 342, to_hash: {}) }

  it 'does something' do
    scraper.scrape
  end

  #before do
  #  scraper.stub(:status_node).and_return(mock_status)
  #  scraper.stub(:derby_page_links).and_return(mock_links)
  #  scraper.stub(:primary_content_entries).and_return(mock_entries)
  #
  #  scraper.stub(:doc).and_return(mock_document)
  #end

  it 'creates a new derby page node' do
    mock_page_node.stub(valid?: false)
    Nodes::DerbyPage.should_receive(:new).with(mock_links, mock_status).and_return(mock_page_node)


  end

  context 'with a valid derby page node' do
    before do
      Nodes::DerbyPage.stub(:new).and_return(mock_page_node)
      mock_page_node.stub(valid?: true)
    end

    context 'when this derby does not exist in the db' do
      let(:new_derby) { double('new derby') }

      it 'creates a new derby object' do
        ::Derby.should_receive(:create).with(instance_of(Hash)).and_return(new_derby)

        scraper.scrape
      end
    end

    context 'when this derby does exist in the db' do
      let(:existing_derby) { double('existing derby') }

      it 'finds the derby object' do
        ::Derby.should_receive(:where).with(derby_id: 342).and_return([existing_derby])

        scraper.scrape
      end
    end

    context 'with a valid derby object' do
      let(:mock_derby) { double('derby', derby_id: 312) }
      let(:mock_entries) { [double('entry 1'), double('entry 2')] }

      before do
        scraper.stub(:find_or_create).and_return(mock_derby)
        scraper.stub(:primary_content_entries).and_return(mock_entries)
      end

      it 'calls to the DerbyEntry scraper to find or create each entry' do
        Scrapers::DerbyEntry.should_receive(:find_or_create).with(mock_entries.first, 312).ordered
        Scrapers::DerbyEntry.should_receive(:find_or_create).with(mock_entries.last, 312).ordered

        scraper.scrape
      end
    end

    context 'with an invalid derby object' do
      xit 'unsure of desire behavior'
    end
  end

  context 'when the derby page is not valid' do
    xit 'not sure what behavior is desired'
  end
end
