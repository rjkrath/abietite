require 'spec_helper'

describe Scrapers::DerbyPage do
  let(:scraper) { described_class.new }

  it 'loops through the entries' do
  end

  it 'calls Scrapers::DerbyEntry on each found node' do
  end

  context 'with new entries' do
    it 'calls to a notifier to update votes for derby entries' do
    end
  end

  context 'with no new entries' do
    it 'does not call to a notifier' do
    end
  end

  context 'when a derby entry cannot be saved' do
    it 'logs an exception' do
    end

    it 'continues parsing the other entries' do
    end

    it 'enqueues a job to re-save the unsaveable entry' do
    end
  end
end
