class Picture < ApplicationRecord

  def generate
    def gen_filename(name)
      "public/tmp/_#{name}_#{Time.now.strftime("%s")}.jpg"
    end

    # def url_encode(str)
    #   return URI.encode(str)
    # end

    options = {}
    #name = url_encode self.name
    normal = Dir.glob("lib/assets/templates/*.jpg")
    boys = normal + Dir.glob("lib/assets/templates/boys/*.jpg")
    girls = normal + Dir.glob("lib/assets/templates/girls/*.jpg")
    if self.sex == "0"
      options[:template] ||= girls.sample
    elsif self.sex == "1"
      options[:template] ||= boys.sample
    end

    options[:name] ||= self.name
    options[:font] ||= "lib/assets/Adobe.otf"
    #options[:template] ||= "lib/assets/templates/test1.jpg"
    options[:size] ||= "720x1280"
    options[:font_size] ||= 170
    options[:position] ||= "400,600"
    options[:weight] ||= 200

    img_template = MiniMagick::Image.open(options[:template])
    img_template.combine_options do |i|
      i.font options[:font]
      i.pointsize options[:font_size]
      i.weight options[:weight] # There is a bug.
      i.fill "white"
      i.draw "text #{options[:position]} \"#{options[:name]} \""
    end
    result = gen_filename(self.name)
    img_template.write result
    return result
  end

end
