require 'test_helper'

  class RecipeTest <ActiveSupport::TestCase
  
  def setup 
  @cheff = Cheff.create(name: 'bob12', email: 'bob@example.com')
  @recipe = @cheff.recipes.build(name: "Chicken Currry", summery: "this is my favorit curry", 
  description: "need chicken,onin,spices,oil etc etc")
  
  end
  
  test 'recipe shoud be valid' do
    assert @recipe.valid?
  end
  
  test 'cheff_id should be present' do
  @recipe.cheff_id = nil
  assert_not @recipe.valid?
  end
  
  
  test 'name should be present' do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  test 'name length should not be too long' do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end
  test 'name length should not be too short' do
    @recipe.name = 'aaaa'
    assert_not @recipe.valid?
  end
  
  test 'summery should be present' do
   @recipe.summery = ' '
    assert_not @recipe.valid?
  end
  test 'summery length should not be too long' do
    @recipe.summery = 'a' * 151
    assert_not @recipe.valid?
  end
  test 'summery length should not be too short' do
    @recipe.summery = 'a' * 9
    assert_not @recipe.valid?
  end
  
  test 'description should be present' do
    @recipe.description = ' '
    assert_not @recipe.valid?
  end
  test 'description length should not be too long' do
  @recipe.description = 'a' * 501
  assert_not @recipe.valid?
  end
  test 'description length should not be too short' do
    @recipe.description = 'a' * 19
    assert_not @recipe.valid?
  end
  
  
  
  end
 