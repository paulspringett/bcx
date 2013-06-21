require 'spec_helper'

describe Bcx::Client do

  context "http auth" do
    let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

    it "should assign login" do
      expect(client.login).to eq 'bcx-test-user'
    end

    it "should assign password" do
      expect(client.password).to eq 'secret'
    end

    it "should build a Faraday connection" do
      expect(client.connection).not_to be_nil
    end
  end

  context "oauth" do
    let(:client) { Bcx::Client::OAuth.new(client_id: '748cc9c949af86f2e3fb35564f7e209b1d2c27d2', client_secret: '7fba79ec3bf1eb9e278098031414e5a3a41ec842', access_token: 'BAhbByIBsHsiZXhwaXJlc19hdCI6IjIwMTMtMDctMDFUMjE6MTI6MDFaIiwidXNlcl9pZHMiOlsxNzE3NDMwNV0sImNsaWVudF9pZCI6Ijc0OGNjOWM5NDlhZjg2ZjJlM2ZiMzU1NjRmN2UyMDliMWQyYzI3ZDIiLCJ2ZXJzaW9uIjoxLCJhcGlfZGVhZGJvbHQiOiJmZmE1OTgzMzQ3YTY2MWExM2Y1YWE3YTM0ODVhYzk4YiJ9dToJVGltZQ01WBzApGcWMA==--20fd0c6159b19ee6689e149590b14be5fd98bb3b') }

    it "should assign credentials" do
      expect(client.uid).to eq '748cc9c949af86f2e3fb35564f7e209b1d2c27d2'
      expect(client.secret).to eq '7fba79ec3bf1eb9e278098031414e5a3a41ec842'
    end

    it "should provide an access token" do
      expect(client.access_token).not_to be_nil
    end
  end

  # TODO: test handling to reponse errors, with error codes
  # it "should fail for invalid attributes" do
  #   expect { client.projects.create!(name: '') }.to raise_error { |error|
  #     expect(error).to be_a Bcx::ResponseError
  #     expect(error.status).to eq 422
  #   }
  # end

  # Rescue a response error example
  # begin
  #   project = client.projects.create!(name: 'foo')
  # rescue Bcx::ResponseError => response
  #   puts response.status
  #   => 422
  #   puts response.body
  #   => "Name cannot be blank"
  # end


end
