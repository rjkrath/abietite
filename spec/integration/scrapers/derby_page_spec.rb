require 'spec_helper'

describe 'beginning to end DerbyPage scraper' do
  it 'creates a new derby and derby entries' do
    expect(Derby.count).to eq(0)
    expect(DerbyEntry.count).to eq(0)

    Scrapers::DerbyPage.new.scrape

    expect(Derby.count).to eq(1)
    expect(DerbyEntry.count).to be > 0
  end
end
