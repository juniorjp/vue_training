require 'rails_helper'

RSpec.describe UserVote, type: :model do
  context 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:video) }
  end
end
