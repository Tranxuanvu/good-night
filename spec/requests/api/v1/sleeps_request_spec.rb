require 'rails_helper'

RSpec.describe 'Api::V1::Sleeps', type: :request do
  let!(:users) { create_list(:user, 3) }
  let!(:headers) { valid_headers(users.first) }
  let(:today) { Time.zone.today }
  let(:date) { today - today.wday - 6 }
  let!(:sleep1) { create(:sleep, user: users.second, go_to_bed_at: date.to_datetime, wake_up_at: date.to_datetime + 7.hours) }
  let!(:sleep2) { create(:sleep, user: users.second, go_to_bed_at: date.to_datetime + 1.hour, wake_up_at: date.to_datetime + 8.hours) }

  before do
    User.last(2).each do |user|
      UserRelationship.create(follower_id: users.first.id, followee_id: user.id)
    end
  end

  describe 'GET /api/v1/friends-sleep-time-past-week' do
    subject { get '/api/v1/friends-sleep-time-past-week', headers: headers }

    context 'returns sleeps' do
      it do
        subject
        expect(json_response_body).to eq({
          success: true,
          result: SleepSerializer.new([sleep1, sleep2]),
          pagy: {
            current_items: 2,
            current_page: 1,
            total_items: 2,
            total_pages: 1
          }
        }.as_json)
      end
    end
  end
end
