require 'spec_helper'

describe Scrapers::DerbyEntry do

  describe '#find_or_create' do
    context 'when there is no existing derby entry' do
      it 'creates a derby entry' do
        DerbyEntry.should_receive(:create).with(type_of(Hash)).and_return(DerbyEntry.new)
        Scrapers::DerbyEntry.find_or_create(double('mock_node'))
      end
    end

    context 'when there is an existing derby entry' do
      it 'finds the derby entry' do
        DerbyEntry.should_receive(:where).with(id: 1872).and_return(DerbyEntry.new)
        Scrapers::DerbyEntry.find_or_create(double('mock node'))
      end
    end
  end
end
