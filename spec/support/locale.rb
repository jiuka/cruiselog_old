# fix from here: https://stackoverflow.com/questions/1987354/how-to-set-locale-default-url-options-for-functional-tests-rails
class ActionController::TestCase
  module Behavior
    def process_with_default_locale(action, http_method = 'GET', parameters = nil, session = nil, flash = nil)
      parameters = { :locale => I18n.locale }.merge( parameters || {} ) unless I18n.locale.nil?
      process_without_default_locale(action, http_method, parameters, session, flash)
    end
    alias_method_chain :process, :default_locale
  end
end

# fix from here: https://github.com/rspec/rspec-rails/issues/255
class ActionDispatch::Routing::RouteSet::NamedRouteCollection::UrlHelper
  def call(t, args)
    options = { locale: I18n.default_locale }.merge(@options)
    t.url_for(handle_positional_args(t, args, options, @segment_keys))
  end
end

RSpec.configure do |config|
  config.before(:each) do
    I18n.locale = I18n.default_locale
  end
end
