require 'rails_helper'

RSpec.describe Activity, type: :request do
  let(:activity) { FactoryBot.create(:activity) }

  it 'should display show page' do
    get "/activities/#{activity.id}"
    expect(response.status).to eq(200)
  end

  # ...
end
