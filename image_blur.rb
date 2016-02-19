class Image
  def initialize(image_matrix)
    if (image_matrix.flatten.select {|cell| !(cell.eql?(0) || cell.eql?(1))}.empty?)
      @image_matrix = image_matrix
    else
      raise "The array used to create an image can only contain the integer values '0' and '1'. Please try again."
    end
  end

  def output_image
    @image_matrix.each do |row|
      puts(row.join(""))
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image

image2 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1],
  [0, 0, 0, 0]
])

image2.output_image

