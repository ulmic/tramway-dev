#= require justified_images

#$(document).ready ->
#  $('.logo_collage1').empty().justifiedImages
#    images: photos
#    rowHeight: 200
#    maxRowHeight: 400
#    thumbnailPath: (photo, width, height) ->
#      purl = photo.url_s
#      if photo.url_n and (width > photo.width_s * 1.2 or height > photo.height_s * 1.2)
#        purl = photo.url_n
#      if photo.url_m and (width > photo.width_n * 1.2 or height > photo.height_n * 1.2)
#        purl = photo.url_m
#      if photo.url_z and (width > photo.width_m * 1.2 or height > photo.height_m * 1.2)
#        purl = photo.url_z
#      if photo.url_l and (width > photo.width_z * 1.2 or height > photo.height_z * 1.2)
#        purl = photo.url_l
#      purl
#    getSize: (photo) ->
#      {
#        width: photo.width_s
#        height: photo.height_s
#      }
#    margin: 1
