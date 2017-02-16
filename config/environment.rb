# Load the Rails application.
require_relative 'application'

PAPERCLIP_ATTACHMENT_OPTIONS = {
  use_timestamp:  true,
  whiny:          false,
  path:           ':class/:id/:style.:extension', # e.g. photographs/345/small.jpg
  storage:        :s3,
  s3_protocol:    'https',
  s3_credentials: {
    bucket: "audreypenven.#{Rails.env}",
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION'),
  },
  swallow_stderr: true
}

# Initialize the Rails application.
Rails.application.initialize!
