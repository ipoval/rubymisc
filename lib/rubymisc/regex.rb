# encoding: utf-8

module Rubymisc
  module Regex
    autoload :Manual, File.expand_path('../regex/manual', __FILE__)

    class << self
      def email
        email_name_regex  = '[\w\.%\+\-]+'.freeze
        domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
        domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
        /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
      end

      def url
        /\A((https?):(([A-Za-z0-9$_.+!*(),;\/?:@&~=-])|%[A-Za-z0-9]{2}){2,}(#([a-zA-Z0-9][a-zA-Z0-9$_.+!*(),;\/?:@&~=%-]*))?([A-Za-z0-9$_+!*();\/?:~-]))\z/
      end

      def zip
        /\A\d{5}(?:-\d{4})?\z/
      end

      def ipv4
        ip_octet = '(\d|[01]?\d\d|2[0-4]\d|25[0-5])'.freeze
        /\A#{ip_octet}\.#{ip_octet}\.#{ip_octet}\.#{ip_octet}\z/
      end

      def mac_address
        /\A(\h{2}:){5}\h{2}\z/
      end

      def hexcode
        /\A#(\h{3}){1,2}\z/
      end

      def usd
        /\A\$(\d{1,3}(\,\d{3})*|\d+)(\.\d{2})?\z/
      end
    end

    code = <<-CODE
      def man; Manual.man; end
    CODE

    singleton_class.module_eval code
  end
end
