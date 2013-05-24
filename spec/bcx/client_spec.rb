require 'spec_helper'

describe Bcx::Client do

  let(:client) { Bcx::Client.new(:http, login: 'username', password: 'secret') }

  describe "http auth" do
    it "should assign login" do
      expect(client.login).to eq 'username'
    end

    it "should assign password" do
      expect(client.password).to eq 'secret'
    end

    it "should build a Faraday connection" do
      expect(client.connection).not_to be_nil
    end
  end

end
