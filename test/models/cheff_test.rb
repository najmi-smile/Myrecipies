require 'test_helper'

class CheffTest < ActiveSupport::TestCase
  
  def setup
    @cheff = Cheff.new(name: 'John1', email: 'jhon@hotmail.com')
  end
  
  test 'Cheff should be valid' do
  assert @cheff.valid?
  end
  
  test 'Cheff name should be present' do
  @cheff.name =' '
  assert_not @cheff.valid?
  end
  test 'Cheff name should not be too short' do
    @cheff.name = 'aaaa'
    assert_not @cheff.valid?
  end
  test 'Cheff name should not be too long' do
    @cheff.name = 'a' * 21
    assert_not @cheff.valid?
  end
  
  test 'Email should be present' do
    @cheff.email = ' '
    assert_not @cheff.valid?
  end
  test 'email should be with in bounds' do
    @cheff.email = 'a' * 50 + '@example.com'
    assert_not @cheff.valid?
  end
  test 'Email should be unique' do
  dup_cheff = @cheff.dup
  dup_cheff.email = @cheff.email.upcase
  @cheff.save
  assert_not dup_cheff.valid?
  end
  test 'Email should accept valid addresses' do
  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |valid_address|
       @cheff.email = valid_address
       assert @cheff.valid?, "#{valid_address.inspect} should be valid"
     end
  end
  test 'Email should reject invalid address' do
  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
      @cheff.email = invalid_address
      assert_not @cheff.valid?, "#{invalid_address.inspect} should be invalid"  
      end 
  end
  
  
end
