require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:created_by) }
end
