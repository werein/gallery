# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require video.dev
#= require video-quality-selector
#= require blueimp-gallery-all

linksContainer = $('body').on('click', 'a.gallery', (event) ->
  event = event or window.event
  target = event.target or event.srcElement
  link = (if target.src then target.parentNode else target)
  options =
    index: link
    event: event

  blueimp.Gallery linksContainer.find('a.gallery'), options
)