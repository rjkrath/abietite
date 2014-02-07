require 'rspec'

describe VotesController do

  describe 'when the voter is has proper authentication' do
    describe 'POST create' do
      context 'when the vote is new' do
        it 'saves the vote' do

        end

        describe 'response' do
          it 'responds with a 201' do

          end

          it 'returns a json string of creation' do

          end
        end
      end

      context 'when the vote has already been counted' do
        it 'does not save the vote' do

        end

        describe 'response' do
          it 'responds with a 422' do

          end

          it 'returns a json string of fail' do

          end
        end
      end
    end

    describe 'DELETE destroy' do
      context 'when the vote exists' do
        it 'destroys the vote' do

        end

        describe 'response' do
          it 'responds with a 201(?)' do

          end

          it 'returns a json string of destruction' do

          end
        end
      end

      context 'when the vote does not exist' do
        it 'does not destroy a vote' do

        end

        describe 'response' do
          it 'returns with a 422' do

          end

          it 'returns a json string of fail' do

          end
        end
      end
    end
  end

    describe 'when the voter has no valid authentication' do
    it 'responds with a 410' do

    end

    it 'returns a json string of fail' do

    end
  end

end