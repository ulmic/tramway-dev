# frozen_string_literal: true

module Tramway::Profiles::LinksHelper
  def profile_link(profile)
    send profile.network_name, profile.uid, profile.title
  end

  private

  def vk(uid, title)
    profile_link_template title, "https://vk.com/#{uid}", :vk
  end

  def facebook(uid, title)
    profile_link_template title, "https://facebook.com/#{uid}", :facebook
  end

  def twitter(uid, title)
    profile_link_template title, "https://twitter.com/#{uid}", :twitter
  end

  def instagram(uid, title)
    profile_link_template title, "https://instagram.com/#{uid}", :instagram
  end

  def telegram(uid, title)
    profile_link_template title, "https://intg.me/#{uid}", :telegram
  end

  def patreon(uid, title)
    profile_link_template title, "https://patreon.com/#{uid}", :patreon
  end

  def profile_link_template(title, link, icon)
    link_to link, target: '_blank' do
      concat fab_icon icon
      concat ' '
      concat title
    end
  end
end
