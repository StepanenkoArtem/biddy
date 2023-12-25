# frozen_string_literal: true

require('rails_helper')

RSpec.describe 'health check' do # rubocop:disable RSpec/DescribeClass
  it 'runs rspec test' do
    expect(true).to be_truthy
  end
end
