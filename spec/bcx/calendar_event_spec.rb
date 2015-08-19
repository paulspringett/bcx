load 'vcr.rb'
load 'bcx.rb'

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
    c.default_cassette_options = { record: :new_episodes }
    c.configure_rspec_metadata!
  end

  RSpec.configure do |config|
    config.before(:each) do
      # Set to test account
      Bcx.configure { |config| config.account = '3015337' }
    end
  end

describe Bcx::Resources::CalendarEvent, :vcr do

  let(:client) { Bcx::Client::HTTP.new(login: 'bcx-test-user@mailinator.com', password: 'supersecret') }

  # WARNING this test creates a calendar event, which is then used in later tests
  describe "POST /projects/10215131/calendar_events.json" do
    it "should create a new calendar event" do
        calendar_event = client.projects(10215131).calendar_events.create!(summary: 'My calendar event', all_day: true, starts_at: Date.today)
        expect(calendar_event.created_at).not_to be_blank
        expect(calendar_event.summary).to eq 'My calendar event'
    end
  end

  describe "POST /projects/10215131/calendar_events.json" do
    it "should create a new comment for a calendar event" do
      comment = client.projects(10215131).calendar_events(21015316).comments.create!(content: "WOW!")
        expect(comment.created_at).not_to be_blank
        expect(comment.content).to eq 'WOW!'
    end
  end

  describe "GET /projects/10215131/calendar_events/21015316.json" do
    let(:calendar_event) { client.projects(10215131).calendar_events!(21015316) }

    it "should return a hash" do
        expect(calendar_event).to be_a Hashie::Mash
    end

    it "should have the correct id" do
        expect(calendar_event.id).to eq 21015316
        expect(calendar_event.summary).to eq 'My calendar event'
    end
  end

  describe "GET /projects/10215131/calendar_events/past" do
    let(:calendar_events) { client.projects(10215131).calendar_events.past! }

    it "should be an array" do
      expect(calendar_events).to be_an Array
    end

    it "should be empty" do
      expect(calendar_events).to be_empty
    end
  end

  describe "PUT /projects/10215131/calendar_events/21015316.json" do
    it "should update an existing calendar event" do
      calendar_event = client.projects(10215131).calendar_events(21015316).update!(summary: 'My updated calendar event')
      expect(calendar_event.summary).to eq 'My updated calendar event'
    end
  end

  describe "DELETE /projects/10215131/calendar_events/21015316.json" do
    it "should trash the given calendar event" do
      client.projects(10215131).calendar_events(21015316).delete!
      calendar_event = client.projects(10215131).calendar_events!(21015316)
      expect(calendar_event.trashed).to be true
    end
  end

end
