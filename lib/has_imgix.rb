require 'imgix'
module HasImgix

  class << self
    mattr_accessor :host, :token, :secure
    self.host = ''
    self.token = ''
    self.secure = false
  end

  def self.setup(&block)
    yield self
  end

  module HasImgix
    extend ActiveSupport::Concern
    included do
    end

    module ClassMethods

      def has_imgix(method_name, options = {})
        self.send :define_method, method_name do
          imgix_url(options[:options], options[:attachment]||:asset, options[:style]||:original)
        end
        include HasImgix::HasImgix::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      
      def imgix_client
        @client ||= Imgix::Client.new(:host => HasImgix.host, :token => HasImgix.token, :secure => HasImgix.secure)
      end

      def imgix_url(options={}, attachment=:asset, style=:original)
        imgix_client.path(send(attachment.to_sym).path(style.to_sym)).to_url(options) rescue ''
      end
    end
  end
end
ActiveRecord::Base.send :include, HasImgix::HasImgix