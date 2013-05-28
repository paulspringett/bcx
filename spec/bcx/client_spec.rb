require 'spec_helper'

describe Bcx::Client do

  let(:client) { Bcx::Client.new(:http, login: 'bcx-test-user', password: 'secret') }

  describe "http auth" do
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
