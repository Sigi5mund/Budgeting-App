require ('minitest/autorun')
require_relative ('../strings.rb')


class HelperTest < MiniTest::Test


  def test_titleize
    result = StringHelper.titleize('Scottish power')
    assert_equal('Scottish Power', result)
  end
end
