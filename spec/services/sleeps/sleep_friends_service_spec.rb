require 'rails_helper'

RSpec.describe 'Sleeps::SleepFriendsService' do
  let!(:users) { create_list(:user, 3) }
  let(:today) { Time.zone.today }
  let(:start_date) { today - today.wday - 6 }
  let(:end_date) { today - today.wday }
  let!(:sleep1) { create(:sleep, user: users.second, go_to_bed_at: start_date.to_datetime, wake_up_at: start_date.to_datetime + 7.hours) }
  let!(:sleep2) { create(:sleep, user: users.second, go_to_bed_at: start_date.to_datetime + 1.hour, wake_up_at: start_date.to_datetime + 8.hours) }

  before do
    User.last(2).each do |user|
      UserRelationship.create(follower_id: users.first.id, followee_id: user.id)
    end
  end

  describe '#call' do
    subject { Sleeps::SleepFriendsService.new(current_user: users.first, date_filter: [start_date, end_date]) }

    context 'returns sleeps' do
      it do
        expect(subject.call).to eq([sleep1, sleep2])
      end
    end
  end
end
