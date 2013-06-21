require 'spec_helper'

describe Bcx::Resources::Todo, :vcr do
  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

  describe "POST /projects/2951531/todolists/8268819/todos.json" do
    it "should create a new todo" do
      todo = client.projects(2951531).todolists(8268819).todos.create!(content: 'My todo')
      expect(todo.created_at).not_to be_blank
      expect(todo.content).to eq 'My todo'
    end
  end

  describe "GET /projects/2951531/todos/48545200.json" do
    let(:todo) { client.projects(2951531).todos!(48545200) }

    it "should return a hash" do
      expect(todo).to be_a Hashie::Mash
    end

    it "should have the correct id" do
      expect(todo.id).to eq 48545200
      expect(todo.content).to eq 'First todo'
    end
  end

  describe "PUT /projects/2951531/todos/48545200.json" do
    it "should update an existing todo" do
      todo = client.projects(2951531).todos(48545200).update!(content: 'My updated todo')
      expect(todo.content).to eq 'My updated todo'
    end
  end

  describe "DELETE /projects/2951531/todos/48545200.json" do
    it "should delete the given todo" do
      client.projects(2951531).todos(48545200).delete!
      expect { client.projects(2951531).todos!(48545200) }.to raise_error { |error|
        expect(error).to be_a Bcx::ResponseError
        expect(error.status).to eq 404
      }
    end
  end
end
