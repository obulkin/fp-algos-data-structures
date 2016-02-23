class Image
  attr_reader :image_matrix # Needed for testing

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

  def blur!
    # Makes a deeper copy for building the new image
    blurred_matrix = @image_matrix.map(&:clone)
    # Special case for images with only one row
    if @image_matrix[0].class != Array
      max_index = @image_matrix.length - 1
      @image_matrix.each_with_index do |cell, index|
        if cell == 1
          blurred_matrix[index - 1] = 1 if index - 1 >= 0
          blurred_matrix[index + 1] = 1 if index + 1 <= max_index
        end
      end
    # General case for multi-row images 
    else
      max_column_index = @image_matrix.length - 1
      max_row_index = @image_matrix[0].length - 1
      @image_matrix.each_with_index do |row, column_index|
        row.each_with_index do |cell, row_index|
          if cell == 1
            blurred_matrix[column_index][row_index - 1] = 1 if row_index - 1 >= 0
            blurred_matrix[column_index][row_index + 1] = 1 if row_index + 1 <= max_row_index
            blurred_matrix[column_index - 1][row_index] = 1 if column_index - 1 >= 0
            blurred_matrix[column_index + 1][row_index] = 1 if column_index + 1 <= max_column_index
          end
        end
      end
    end
    @image_matrix = blurred_matrix
    return self # Allows method chaining
  end
end