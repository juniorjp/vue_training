require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:uuid) }
    it { should validate_presence_of(:current_ip) }
  end
end
