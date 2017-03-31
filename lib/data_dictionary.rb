require 'bundler/setup'
require 'looker-sdk'
require 'erb'
require 'rouge'
require 'active_support/inflector'

class DataDictionary

    def self.sdk
      LookerSDK::Client.new(
        :client_id => ENV['LOOKER_CLIENT_ID'],
        :client_secret => ENV['LOOKER_CLIENT_SECRET'],
        :api_endpoint => ENV['LOOKER_ENDPOINT'],
        # Uncomment to use with a self-signed certificate.
        # :connection_options => {:ssl => {:verify => false}},
      )
    end

    def render!
      unless self.class.sdk.respond_to?(:lookml_model_explore)
        puts "Could not connect to Looker. Are your credentials correct?"
        return
      end

      @explore = self.class.sdk.lookml_model_explore("thelook", "order_items")
      @fields = @explore.fields.to_h.values.flatten
      ERB.new(File.read(File.join("lib", "page.html.erb"))).result(binding)
    end

    def sql_highlight(sql)
      formatter = Rouge::Formatters::HTML.new
      lexer = Rouge::Lexers::SQL.new
      formatter.format(lexer.lex(sql))
    end

    def app_link(path)
      "#{ENV['LOOKER_URL']}#{path}"
    end

    def explore_url
      app_link "/explore/#{CGI.escape(@explore.model_name)}/#{CGI.escape(@explore.name)}"
    end

    def explore_field_url(field)
      "#{explore_url}?fields=#{CGI.escape(field.name)}"
    end

end
