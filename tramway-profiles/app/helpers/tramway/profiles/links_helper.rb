# frozen_string_literal: true

module Tramway::Profiles::LinksHelper
  def profile_link(profile)
    profile_link_template profile.title, profile_url(profile), profile.network_name
  end

  DOMAINS = {
    vk: 'vk.com',
    facebook: 'facebook.com',
    twitter: 'twitter.com',
    instagram: 'instagram.com',
    telegram: 'intg.me',
    patreon: 'patreon.com'
  }.with_indifferent_access

  def profile_url(profile)
    "https://#{DOMAINS[profile.network_name]}/#{profile.uid}"
  end

  private

  def profile_link_template(title, link, icon)
    link_to link, target: '_blank' do
      concat fab_icon icon
      concat ' '
      concat title
    end
  end
end
