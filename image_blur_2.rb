class Image
  def initialize(image_matrix)
    @image_matrix = image_matrix
    self.verify_image
  end

  def verify_image
    flattened_image = @image_matrix.flatten
    if @image_matrix.empty? || (@image_matrix[0].class == Array && !@image_matrix.select {|row| row.empty?}.empty?)
      raise "An image should not be empty and should not have empty rows."
    elsif flattened_image.select {|cell| !cell.eql?(0) && !cell.eql?(1)}.length > 0
      raise "The array used to create an image should only contain the integer values '0' and '1'."
    elsif @image_matrix[0].class == Array &&  flattened_image.length % @image_matrix[0].length != 0
      raise "An image should not be based on a jagged matrix."
    end
  end

  def output_image
    @image_matrix.each do |row|
      puts row.join("")
    end
  end
end