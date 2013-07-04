require 'spec_helper'

describe Bcx::Launchpad do
  context "oauth" do
    let(:launchpad) { Bcx::Launchpad::OAuth.new(client_id: '748cc9c949af86f2e3fb35564f7e209b1d2c27d2', client_secret: '7fba79ec3bf1eb9e278098031414e5a3a41ec842', access_token: 'BAhbByIBsHsiZXhwaXJlc19hdCI6IjIwMTMtMDktMTNUMTI6NDk6MzBaIiwidXNlcl9pZHMiOlsxNzE3NDMwNV0sImNsaWVudF9pZCI6Ijc0OGNjOWM5NDlhZjg2ZjJlM2ZiMzU1NjRmN2UyMDliMWQyYzI3ZDIiLCJ2ZXJzaW9uIjoxLCJhcGlfZGVhZGJvbHQiOiJmZmE1OTgzMzQ3YTY2MWExM2Y1YWE3YTM0ODVhYzk4YiJ9dToJVGltZQ2sYRzA05PlxQ==--e995b8e9cb3cc37b7f4f90d967bb23d889145384') }

    it "should assign credentials" do
      expect(launchpad.uid).to eq '748cc9c949af86f2e3fb35564f7e209b1d2c27d2'
      expect(launchpad.secret).to eq '7fba79ec3bf1eb9e278098031414e5a3a41ec842'
    end

    it "should provide an access token" do
      expect(launchpad.access_token).not_to be_nil
    end
  end
end
