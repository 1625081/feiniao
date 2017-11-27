# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $('.selection')
    .dropdown()

  $("#submit_info").on "click", ->
    $("form").submit()

  $('.ui.form')
    .form({
      fields : {
        title : {
          identifier : 'picture[name]',
          rules: [
            {
              type  : 'empty',
              prompt  : '你没有名字的么......'
            },{
              type  : 'maxLength[6]',
              prompt : '名字真的可以取这么长么......'
            }
          ]
        },
        content : {
          identifier : 'picture[sex]',
          rules : [
            {
              type  : 'empty',
              prompt  : '还是填写一下性别吧...'
            }
          ]
        }
      }
    })
