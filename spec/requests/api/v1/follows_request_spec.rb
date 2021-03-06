require 'rails_helper'

RSpec.describe 'Api::V1::Follows', type: :request do
  let!(:users) { create_list(:user, 3) }
  let!(:headers) { valid_headers(users.first) }

  describe 'POST /api/v1/users/:id/follow' do
    subject { post "/api/v1/users/#{users.second.id}/follow", headers: headers }

    context 'follow successfull' do
      before { subject }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'creates a user relationship' do
        expect(json_response_body).to eq({ success: true, message: 'Follow user successfully' }.as_json)
      end
    end

    context 'follow unsuccessfull' do
      before do
        allow_any_instance_of(UserRelationship).to receive(:save).and_return(false)
        subject
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it do
        expect(json_response_body).to eq({ success: false, message: 'Follow user unsuccessfully' }.as_json)
      end
    end
  end

  describe 'DELETE /api/v1/users/:id/unfollow' do
    context 'unfollow successfull' do
      let!(:user_relationship) { create(:user_relationship, follower_id: users.first.id, followee_id: users.second.id) }

      before { delete "/api/v1/users/#{users.second.id}/unfollow", headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'destroys a user relationship' do
        expect(json_response_body).to eq({ success: true, message: 'Unfollow user successfully' }.as_json)
      end
    end

    context 'unfollow incorrect user' do
      before { delete "/api/v1/users/#{users.second.id}/unfollow", headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it do
        expect(json_response_body).to eq({ success: false, message: 'You still not follow this user yet' }.as_json)
      end
    end
  end


end
