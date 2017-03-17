class PhotoImporter
  PHOTODUMP_BUCKET = 'audreypenven.photodump'

  attr_reader :photo_list, :client, :photographs
  def initialize(folder)
    @client = Aws::S3::Client.new( region: ENV.fetch('AWS_REGION'),
                                  access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                                  secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'))
    @photo_list = client.list_objects(bucket: PHOTODUMP_BUCKET, prefix: folder).contents
    @photographs = []
  end

  def import(photo_options = {})
    @photo_list.each do |s3_object|
      response = @client.get_object(bucket: PHOTODUMP_BUCKET, key: s3_object.key)

      @photographs << Photograph.create({image: response.body}.merge photo_options.slice(:title, :taken_on))
    end
  end
end