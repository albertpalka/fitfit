require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { FactoryBot.build(:activity) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(activity).to be_valid
    end

    it 'is invalid without original location' do
      activity.original_location = nil

      expect(activity).to_not be_valid
    end

    it 'is invalid without destination location' do
      activity.destination_location = nil
      expect(activity).to_not be_valid
    end

    it 'is invalid without distance' do
      activity.distance = nil

      expect(activity).to_not be_valid
    end
  end
end
