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
    return self # Allows method chaining
  end

  def output_image
    @image_matrix.each do |row|
      puts row.join("")
    end
  end

  def blur!(man_distance)
    # Special case for images with only one row
    if @image_matrix[0].class != Array
      blurred_matrix = @image_matrix.map {|cell| cell} # Make a deep copy for building the new image
      max_index = @image_matrix.length - 1
      @image_matrix.each_with_index do |cell, index|
        if cell == 1
          (1..man_distance).each do |distance|
            blurred_matrix[index - distance] = 1 if index - distance >= 0
            blurred_matrix[index + distance] = 1 if index + distance <= max_index
          end
        end
      end
    # General case for multi-row images 
    else
      blurred_matrix = @image_matrix.map(&:clone) # Make a deep copy for building the new image
      max_column_index = @image_matrix.length - 1
      max_row_index = @image_matrix[0].length - 1
      @image_matrix.each_with_index do |row, column_index|
        row.each_with_index do |cell, row_index|
          if cell == 1
            (0..man_distance).each do |column_distance|
              (0..man_distance - column_distance).each do |row_distance|
                blurred_matrix[column_index - column_distance][row_index - row_distance] = 1 if column_index - column_distance >= 0 && row_index - row_distance >= 0
                blurred_matrix[column_index + column_distance][row_index - row_distance] = 1 if column_index + column_distance <= max_column_index && row_index - row_distance >= 0
                blurred_matrix[column_index - column_distance][row_index + row_distance] = 1 if column_index - column_distance >= 0 && row_index + row_distance <= max_row_index
                blurred_matrix[column_index + column_distance][row_index + row_distance] = 1 if column_index + column_distance <= max_column_index && row_index + row_distance <= max_row_index
              end
            end
          end
        end
      end
    end
    @image_matrix = blurred_matrix
    return self # Allows method chaining
  end
end