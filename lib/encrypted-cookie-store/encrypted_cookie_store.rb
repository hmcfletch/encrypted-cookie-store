require 'encrypted-cookies'

module EncryptedCookieStore
  # swap out the signed cookie jar for an encrypted cookie jar
  class EncryptedCookieStore < ActionDispatch::Session::CookieStore
    def unpacked_cookie_data(env)
      env["action_dispatch.request.unsigned_session_cookie"] ||= begin
        stale_session_check! do
          request = ActionDispatch::Request.new(env)
          if data = request.cookie_jar.encrypted[@key]
            data.stringify_keys!
          end
          data || {}
        end
      end
    end

    def set_cookie(request, options)
      request.cookie_jar.encrypted[@key] = options
    end
  end
end

ActionDispatch::Session.send(:include, EncryptedCookieStore)