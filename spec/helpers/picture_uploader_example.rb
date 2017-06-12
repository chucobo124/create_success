module PictureUploaderExample
  def create_pictures(picture_number)
    pictures = []
    picture_path = 'public/test_pictures'
    Dir.mkdir(picture_path) unless File.directory?(picture_path)
    picture_number.times do |index|
      current_image_path = "#{picture_path}/picture#{index}.png"
      unless File.exist? current_image_path
        MiniMagick::Image.open(Faker::Avatar.image).combine_options do |pic|
          pic.write current_image_path
          pic.flip
        end
      end
      pictures << current_image_path
    end
    pictures
  end

  def remove_pictures
    FileUtils.rm_rf(File.join(Rails.root, 'public/uploads'))
  end
end
