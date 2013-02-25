require 'test_helper'

class NewsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    VCR.configure { |c| c.allow_http_connections_when_no_cassette = true }
    Capybara.reset_sessions!
    sign_in
  end

  def teardown
    VCR.configure { |c| c.allow_http_connections_when_no_cassette = false }
  end

  test "adds and deletes news item" do
    visit '/'
    click_link 'Latest News'
    click_link 'New News Item'

    select 'Events & Exhibitions', from: 'Category'
    fill_in 'Content', with: 'Test **news** story'
    attach_file 'Image', 'test/fixtures/image.jpg'
    click_button 'Save and Publish'

    assert page.has_selector?('.success', text: 'News Item saved successfully')

    assert page.has_text? 'Test news story'
    assert page.has_selector?('.news-item strong', text: 'news'), 'News content should have <strong> element'
    assert_equal 'http://goldfinchjewellery.s3-eu-west-1.amazonaws.com/image.jpg', page.find('.news-item img')['src']

    uri = URI('http://goldfinchjewellery.s3-eu-west-1.amazonaws.com/image.jpg')
    response = Net::HTTP.get_response(uri)
    assert_equal '200', response.code

    # delete the news item
    visit '/'
    click_link 'Latest News'

    news_item = find(:xpath, "//article[descendant::p[contains(text(), 'Test')]]")
    news_item.click_link('Delete')

    assert page.has_selector?('.success', text: 'News Item deleted successfully')
    refute page.has_text?('Test news story')
    refute page.has_selector?('.news-item strong', text: 'news')

    response = Net::HTTP.get_response(uri)
    assert_equal '403', response.code
  end
end
