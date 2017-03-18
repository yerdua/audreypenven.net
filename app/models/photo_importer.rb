class PhotoImporter
  PHOTODUMP_BUCKET = 'audreypenven.photodump'

  attr_reader :client, :photographs, :bucket, :errors
  def initialize
    @client = Aws::S3::Client.new( region: ENV.fetch('AWS_REGION'),
                                  access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                                  secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'))

    @bucket = Aws::S3::Bucket.new(name: PHOTODUMP_BUCKET, client: @client)
    @photographs = []
    @errors = []
  end

  def import(options = {})
    @bucket.objects.each do |s3_object|
      begin
        @photographs << Photograph.create!( image: URI.parse(s3_object.public_url),
                                            title: options[:title],
                                            taken_on: options[:taken_on],
                                            album_ids: options[:album_ids])
        s3_object.delete
      rescue Exception => ex
        @errors << ex
      end
    end
  end
end