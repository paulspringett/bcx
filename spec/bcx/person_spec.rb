require 'spec_helper'

describe Bcx::Resources::Person, :vcr do
  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

  describe "GET /people.json" do
    let(:people) { client.people! }

    it "should be an array" do
      expect(people).to be_an Array
    end

    it "first person should have the correct id" do
      expect(people.first.id).to eq 4666033
    end
  end

  describe "GET /people/4666033.json" do
    let(:person) { client.people!(4666033) }

    it "should return a hash" do
      expect(person).to be_a Hashie::Mash
    end

    it "should have the correct id" do
      expect(person.id).to eq 4666033
    end
  end

  describe "GET /people/me.json" do
    let(:person) { client.people.me! }

    it "should return a hash" do
      expect(person).to be_a Hashie::Mash
    end

    it "should have the correct id" do
      expect(person.id).to eq 4666033
    end

    it "should have assigned todos" do
      expect(person.assigned_todos).to be_a Hashie::Mash
    end
  end

  describe "GET /people/trashed.json" do
    let(:people) { client.people.trashed! }

    it "should be an array" do
      expect(people).to be_an Array
    end

    it "first person should have the correct id" do
      expect(people.first.id).to eq 4666033
    end
  end

  describe "DELETE /people/4904728.json" do
    it "should delete a todolist" do
      client.people(4904728).delete!
      expect { client.people!(4904728) }.to raise_error { |error|
        expect(error).to be_a Bcx::ResponseError
        expect(error.status).to eq 404
      }
    end
  end
end
