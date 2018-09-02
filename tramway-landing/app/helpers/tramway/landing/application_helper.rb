module Tramway
  module Landing
    module ApplicationHelper
      include Tramway::Admin::RussianCasesHelper
      include Tramway::Profiles::LinksHelper

      def header_block(block, title:, tagline:)
        OpenStruct.new title: title, tagline: tagline, background: block.background
      end
    end
  end
end
