require 'spec_helper'

describe GravatarUrlGenerator do
  it "should append the MD5 digest to the end of the url" do
    address = "example@example.com"
    digest = Digest::MD5::hexdigest(address)
    result = "https://secure.gravatar.com/avatar/#{digest}"
    expect(GravatarUrlGenerator.create_url(address)).to eq(result)
  end

  context "MD5 digest" do
    it "should make a digest of the user's email address" do
      address = "example@example.com"
      digest = Digest::MD5::hexdigest(address)
      expect(GravatarUrlGenerator.gravatar_id(address)).to eq(digest)
    end

    it "should downcase the input email before digest" do
      address = "exAMPle@EXAMplE.com"
      digest = Digest::MD5::hexdigest(address.downcase)
      expect(GravatarUrlGenerator.gravatar_id(address)).to eq(digest)
    end
  end
end
