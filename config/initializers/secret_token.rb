# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exists?(token_file)
	# Use the existing token.
	File.read(token_file).chomp
  else
  	# Generate a new token and store it in token_file.
  	token = SecureRandom.hex(64)
  	File.write(token_file, token)
  	token
  end
end
	
SampleApp::Application.config.secret_key_base = 'f67cdf0353cc7b7dd06c45ef5f9917fc2ad3fe1fe1549c8844b23d29e35ce43b0991c33aca686da1794518c1a278452370ca4badc4c26a2272b9665427fa0648'
