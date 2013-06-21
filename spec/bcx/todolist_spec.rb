require 'spec_helper'

describe Bcx::Resources::Todolist, :vcr do
  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

  describe "GET /projects/2937644/todolists.json" do
    let(:todolists) { client.projects(2956584).todolists! }

    it "should be an array" do
      expect(todolists).to be_an Array
    end

    it "first todolist should have the correct id" do
      expect(todolists.first.id).to eq 7701209
    end
  end

  describe "GET /projects/2956584/todolists/completed.json" do
    let(:todolists) { client.projects(2956584).todolists.completed! }


    it "should be an array" do
      expect(todolists).to be_an Array
    end

    it "first todolist should have the correct id" do
      expect(todolists.first.id).to eq 7701289
    end
  end

  describe "GET /todolists.json" do
    let(:todolists) { client.todolists! }

    it "should be an array" do
      expect(todolists).to be_an Array
    end

    it "first todolist should have the correct id" do
      expect(todolists.first.id).to eq 7701209
    end
  end

  describe "GET /todolists/completed.json" do
    let(:todolists) { client.todolists.completed! }


    it "should be an array" do
      expect(todolists).to be_an Array
    end

    it "first todolist should have the correct id" do
      expect(todolists.first.id).to eq 7701289
    end
  end

  describe "GET /projects/123/todolists/456.json" do
    let(:todolist) { client.projects(2956584).todolists!(7701289) }

    it "should return a hash" do
      expect(todolist).to be_a Hashie::Mash
    end

    it "should have the correct id" do
      expect(todolist.id).to eq 7701289
    end
  end

  describe "POST /projects/123/todolists.json" do
    it "should create a new todolist" do
      todolist = client.projects(2956584).todolists.create!(name: 'My todolist', description: 'This is a todolist')
      expect(todolist.created_at).not_to be_blank
    end
  end

  describe "PUT /projects/2956584/todolists/8268819.json" do
    it "should create a new todolist" do
      todolist = client.projects(2951531).todolists(8268819).update!(name: 'Renamed todolist')
      expect(todolist.name).to eq 'Renamed todolist'
    end
  end

  describe "DELETE /projects/2956584/todolists/8268819.json" do
    it "should create a new todolist" do
      todolist = client.projects(2951531).todolists(8268819).update!(name: 'Renamed todolist')
      expect(todolist.name).to eq 'Renamed todolist'
    end

    it "should delete a todolist" do
      client.projects(2951531).todolists(8268819).delete!
      expect { client.projects(2951531).todolists!(8268819) }.to raise_error { |error|
        expect(error).to be_a Bcx::ResponseError
        expect(error.status).to eq 404
      }
    end
  end
end
