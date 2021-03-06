require 'rack_session_access'
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  config.serve_static_assets  = true
  config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=3600' }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr
  config.middleware.use RackSessionAccess::Middleware

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
def log_on_as(user)
  if Object.const_defined?('Devise')
      warden_scope = Devise.warden_config[:default_scope].to_s
      warden_class = warden_scope.camelize.constantize
      user = warden_class.find_by(email: user) if user.is_a?(String)
      page.set_rack_session("warden.user.#{warden_scope}.key" => warden_class.serialize_into_session(user))
  elsif user.is_a? ActiveRecord::Base
      page.set_rack_session('#{user.class.underscore}_id'.to_sym => user.id)
  elsif user.is_a? Fixnum
      page.set_rack_session(user_id: user)
  end
end

def get_named_route(name, *args)
  send(name.downcase.gsub(' ', '_') + '_path', *args)
end
