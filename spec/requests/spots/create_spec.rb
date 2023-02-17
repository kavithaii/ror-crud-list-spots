require 'rails_helper'

describe 'POST /spots' do
  # 'scenario' is similar to 'it', use which you see fit
  
  scenario 'valid spot attributes' do
    # send a POST request to /spots, with these parameters
    # The controller will treat them as JSON 
    post '/spots', params: {
      spot: {
        title: "Sniff bone",
        description: "Great place in hot of Seattle",
        price: 10
      }
    }

    # response should have HTTP Status 201 Created
    expect(response.status).to eq(201)

    json = JSON.parse(response.body).deep_symbolize_keys
    
    # check the value of the returned response hash
    expect(json[:description]).to eq('Great place in hot of Seattle')
    expect(json[:title]).to eq('Sniff bone')

    # 1 new spot record is created
    expect(Spot.count).to eq(1)

    # Optionally, you can check the latest record data
    expect(Spot.last.title).to eq('Sniff bone')
  end

  scenario 'invalid spot attributes' do
    post '/spots', params: {
      spot: {
        title: '',
        description: 'Great place in hot of Seattle'
      }
    }

    # response should have HTTP Status 201 Created
    expect(response.status).to eq(422)

    json = JSON.parse(response.body).deep_symbolize_keys
    expect(json[:url]).to eq(["can't be blank"])

    # no new spot record is created
    expect(Spot.count).to eq(0)
  end
end
