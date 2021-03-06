require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:adam)
    @micropost = @user.microposts.build(content: "Lorem Ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user_id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "       "
    assert_not @micropost.valid?
  end

  test "content should be no more than 140 chars" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "Order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
