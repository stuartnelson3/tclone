class GravatarUrlGenerator
  def self.create_url(email_address)
    "https://secure.gravatar.com/avatar/#{gravatar_id(email_address)}"
  end
  def self.gravatar_id(email_address)
    Digest::MD5::hexdigest(email_address.downcase)
  end
end
