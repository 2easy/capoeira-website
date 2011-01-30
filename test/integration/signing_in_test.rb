require 'integration_test_helper'

class SigningInTest < ActionController::IntegrationTest
  def go_to_root
    visit '/'
  end
  test 'signing in' do
    go_to_root
    assert page.has_content?('capoeira')
  end
end
