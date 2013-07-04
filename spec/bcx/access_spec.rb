require 'spec_helper'

describe Bcx::Resources::Access, :vcr do
  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

  describe "GET /projects/2951531/accesses.json" do
    let(:accesses) { client.projects(2951531).accesses! }

    it "should be an array" do
      expect(accesses).to be_an Array
    end

    it "first access should have the correct id" do
      expect(accesses.first.id).to eq 4666033
    end
  end

  describe "POST /projects/2951531/accesses.json" do
    it "should grant access" do
      client.projects(2951531).accesses.create!(email_addresses: ["hopper.derek@gmail.com"])
      accesses = client.projects(2951531).accesses!
      accesses.detect { |access| access.id == 4996562 }.should be_present
    end
  end

  describe "DELETE /projects/2951531/accesses/4996562.json" do
    it "should revoke access" do
      client.projects(2951531).accesses(4996562).delete!
      accesses = client.projects(2951531).accesses!
      accesses.detect { |access| access.id == 4996562 }.should_not be_present
    end
  end
end
