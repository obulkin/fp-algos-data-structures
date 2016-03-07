require_relative "../image_blur_3.rb"

RSpec.describe Image do
	describe "#initialize" do
		it "will throw an error if initial data is invalid" do
			expect {Image.new([2, 0, 0, 1])}.to raise_error(RuntimeError)
		end
	end

	describe "#verify_image" do
		it "will throw a specific error if the image is empty or contains an empty row" do
			expect {Image.new([])}.to raise_error("An image should not be empty and should not have empty rows.")
			expect {Image.new([[1, 0], [], [0, 0]])}.to raise_error("An image should not be empty and should not have empty rows.")
		end
		it "will throw a specific error if the image contains values other than 0 and 1" do
			expect {Image.new([2,1])}.to raise_error("The array used to create an image should only contain the integer values '0' and '1'.")
		end
		it "will throw a specific error if the image is jagged" do
			expect {Image.new([[1, 1, 1], [0, 0], [0, 0, 0]])}.to raise_error("An image should not be based on a jagged matrix.")
		end
	end

	describe "#output_image" do
		it "will print to the standard output in the right format" do
			expect {Image.new([[1, 1], [0, 0]]).output_image}.to output("11\n00\n").to_stdout
		end
	end

	describe "#blur!" do
		it "should transform various images properly when given different blur distances" do
			expect(Image.new([0, 0, 0, 1, 0, 0, 0]).blur!(2).image_matrix).to eq(Image.new([0, 1, 1, 1, 1, 1, 0]).image_matrix)
			expect(Image.new([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]).blur!(1).image_matrix).to eq(Image.new([[0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [0, 0, 0, 0]]).image_matrix)
			expect(Image.new([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]).blur!(2).image_matrix).to eq(Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 0], [0, 1, 0, 0]]).image_matrix)
			expect(Image.new([[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 1]]).blur!(3).image_matrix).to eq(Image.new([[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0, 0, 0], [0, 1, 1, 1, 1, 1, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 0, 0, 1, 1, 1], [0, 0, 0, 0, 0, 1, 1, 1, 1]]).image_matrix)
		end
	end
end