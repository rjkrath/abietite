require 'rspec'

describe Scrapers::FrontPage do
  let(:scraper) { described_class.new }

  it 'finds the current object for sale' do
  end

  context 'when the sale object is new' do
    it 'creates the front page object' do
    end

    it 'calls to a notifier for voter notification' do
    end
  end

  context 'when the sale object already exists' do
    it 'does not call to a notifier for voter notifications' do
    end
  end

  context 'when the sale object cannot be saved' do
    it 'raises an exception' do
    end

    it 're-enqueues the front page scraper job' do
    end
  end
end