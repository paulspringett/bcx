require "spec_helper"

describe Bcx::Resources::Attachment, :vcr do
  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user', password: 'secret') }

  describe "GET /attachments.json" do
    let (:attachments) { client.attachments! }

    it "should be an array" do
      expect(attachments).to be_an Array
    end

    it "first attachment should have correct title" do
      expect(attachments.first.name). to eql "bigbasecamplogo.png"
    end

  end

  describe "GET /projects/10268857/attachments/176354961.json" do
    let(:attachment) { client.projects(10268857).attachments!(176354961) }

    it "should return a hash" do
      expect(attachment).to be_a Hashie::Mash
    end

    it "should have the correct id" do
      expect(attachment.id).to eq 176354961
    end
  end

  describe "DELETE /projects/10268857/attachments/176355933.json" do
    let(:attachment) { client.projects(10268857).attachments(176355933) }

    it "should delete an attachment" do
      expect { attachment.delete! }.to_not raise_error
      expect(client.projects(10268857).attachments!(176355933).trashed).to be true
    end
  end

  describe "PUT /projects/10268857/attachments/176354961.json" do
    let(:attachment) { client.projects(10268857).attachments(176354961) }

    it "renames an attachment" do
      expect(attachment.call!.name). to eql "bigbasecamplogo.png"
      expect{ attachment.update!(name: "smallbasecamplogo.png") }.to_not raise_error
      expect(attachment.call!.name).to eql "smallbasecamplogo.png"
    end
  end

  describe 
end
