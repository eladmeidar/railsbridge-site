# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railsbridge-site_session',
  :secret      => 'db4134a29c25fe3d6f226f949fd35886d20b8221973a08f0b95b0738d7b8debda6de9d0fbdf6f9f51832d9c999b96f578ba0d68ad2e57276c8ad88a66f9f5132'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
