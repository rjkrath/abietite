require 'spec_helper'

describe Scrapers::DerbyPage do
  let(:doc) { double('nokogiri parsed document', css: []) }
  let(:scraper) { described_class.new('shirt derby url', doc) }

  describe '.scrape_derby' do

    let(:derby_page_node) { double('page node', valid?: true, derby_id: 15, to_hash: {}) }

    before do
      Derby.stub(:create)
      Nodes::DerbyPage.stub(:new).and_return(derby_page_node)
    end

    it 'parses the page into a DerbyPage Node' do
      Nodes::DerbyPage.should_receive(:new).and_return(derby_page_node)
      scraper.scrape
    end

    context 'with an invalid DerbyPage node' do
      before { derby_page_node.stub(valid?: false) }

      it 'does not find or create a derby' do
        Derby.should_not_receive(:find_by)
        Derby.should_not_receive(:create)
        scraper.scrape
      end
    end

    context 'when the derby does not exist in our db' do
      before { Derby.stub(find_by: nil) }

      it 'attempts to find an existing Derby object' do
        Derby.should_receive(:find_by).and_return(nil)
        scraper.scrape
      end

      it 'attempts to create a new Derby object' do
        Derby.should_receive(:create).with(instance_of(Hash)).and_return(Derby.new)
        scraper.scrape
      end
    end

    context 'when the derby does exist in our db' do
      before { Derby.stub(find_by: Derby.new) }

      it 'attempts to find the existing Derby object' do
        Derby.should_receive(:find_by).and_return(Derby.new)
        scraper.scrape
      end

      it 'does not attempt to create a new Derby object' do
        Derby.should_not_receive(:create)
        scraper.scrape
      end
    end
  end
end
