require 'test_helper'

class CategoryClass < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "sports")
	end

	test "category must be valid" do
		assert @category.valid?
	end

	test "name should be present" do	
		@category.name = " "
		assert_not @category.valid?
	end

	test "name should be unique" do
		@category.save
		category2 = Category.new(name: "sports")
		assert_not category2.valid?
	end

	test "name should not be to long" do
		@category.name = "a" * 26
		assert_not @category.valid?
	end

	test "name should not be to short" do
		@category.name = "aa"
		assert_not @category.valid?
	end


end