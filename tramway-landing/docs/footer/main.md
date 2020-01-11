```haml
= content_for :footer_links do
  %h5
    Важные ссылки здесь
  %ul
    = link_to 'Ссылка 1', 'http://it-way.pro'
    %br
    = link_to 'Ссылка 2', 'http://molodoy.online'

= content_for :footer_logos do
  = link_to 'http://it-way.pro' do
    = image_tag 'logos/it_way_conf.png'
```
