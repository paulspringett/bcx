require 'spec_helper'

describe Bcx::Client do
  use_vcr_cassette 'projects'

  let(:client) { Bcx::Client.new(:http, login: 'bcx-test-user', password: 'secret') }

  describe "GET /projects" do
    let(:projects) { client.projects! }

    it "should be an array" do
      expect(projects).to be_an Array
    end

    it "first project should have the correct id" do
      expect(projects.first.id).to eq 2937644
    end
  end

  describe "GET /projects/archived" do
    let(:projects) { client.projects.archived! }

    it "should be an array" do
      expect(projects).to be_an Array
    end

    it "should be empty" do
      expect(projects).to be_empty
    end
  end

  describe "GET /projects/2937644" do
    let(:project) { client.projects!(2937644) }

    it "should return a hash" do
      expect(project).to be_a Hashie::Mash
    end

    it "should have the correct id" do
      expect(project.id).to eq 2937644
    end
  end

  describe "POST /projects" do
    it "should create a new project" do
      project = client.projects.create!(name: 'New project', description: 'A new project created over the API')
      expect(project.created_at).not_to be_blank
    end
  end
end
