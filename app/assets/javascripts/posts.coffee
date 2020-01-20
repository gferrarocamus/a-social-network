# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change", "#post_picture", ->
  size_in_megabytes = this.files[0].size/1024/1024;
  if size_in_megabytes > 1
    document.getElementById("error-explanation").classList.remove("d-none");
    this.value = ""
    return
