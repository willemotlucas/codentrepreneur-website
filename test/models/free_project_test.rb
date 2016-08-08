require 'test_helper'

class FreeProjectTest < ActiveSupport::TestCase
	test "should not save free project without title" do
		assert_not = FreeProject.create(short_description: "Lorem ipsum", featured: false, active: true)
	end

	test "should not save free project without short description" do
		assert_not = FreeProject.create(title: "Lorem ipsum", featured: false, active: true)
	end
end
