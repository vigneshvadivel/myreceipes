require 'test_helper'

class RecipeTest <ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "viki", email: "viki@example.com")
    @recipe = @chef.recipes.build(name:"chicken briyani", summery:"This is the best chetinadu briyani ever",description:"heat oil add onion,tomoto and masala add chicken cook for 30 mintus")
  end  
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id =nil
    assert_not @recipe.valid?
  end
    
  
  test "name should be present" do
     @recipe.name=" "
     assert_not @recipe.valid?
   end
  
  test "name length not be too long" do
    @recipe.name= "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length not be too short" do
    @recipe.name= "aaaa"
    assert_not @recipe.valid?
  end
  test "summery should be present" do
    @recipe.summery= " "
    assert_not @recipe.valid?
  end
  
  test "summery length not be too long" do
    @recipe.summery= "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summery length not be too short" do
    @recipe.summery= "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description= " "
    assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description= "a" * 501
    assert_not @recipe.valid?
  end
  
  test "description should not be too short" do
    @recipe.description= "a" * 19
    assert_not @recipe.valid?
  end
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
