require 'spec_helper'

describe Bcx::Resources::Comment, :vcr do
  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

  describe "POST /projects/9634353/todos/185137845/comments.json" do
    it "should create a new todo comment" do
      comment = client.projects(9634353).todos(185137845).comments.create!(content: 'New Todo comment')
      expect(comment.created_at).not_to be_blank
    end
  end

  describe "POST /projects/9634353/todolists/29123043/comments.json" do
    it "should create a new todolist comment" do
      comment = client.projects(9634353).todolists(29123043).comments.create!(content: 'New TodoList comment')
      expect(comment.created_at).not_to be_blank
    end
  end

  describe "DELETE /projects/9634353/comments/297584179.json" do
    it "should delete the given comment" do
      client.projects(9634353).comments(297584179).delete!
      expect { client.projects(9634353).comments!(297584179) }.to raise_error { |error|
        expect(error).to be_a Bcx::ResponseError
        expect(error.status).to eq 404
      }
    end
  end


end
