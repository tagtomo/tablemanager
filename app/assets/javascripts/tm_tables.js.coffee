# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
#  $('form').on 'click', '.remove_fields', (event) ->
#    $(this).prev('input[type=hidden]').val('1')
#    $(this).closest('fieldset').hide()
#    event.preventDefault()

#  $('form').on 'click', '.aadd_fields', (event) ->
#    console.log($(".detail_no").size() + 1)
#    time = new Date().getTime()
#    regexp = new RegExp($(this).data('id'), 'g')
#    $(this).before($(this).data('fields').replace(regexp, time))
#    event.preventDefault()

  #行選択
  $(document)
    .on "click" ,".detail",  (event)->
      #選択(click)した明細へクラスを追加する
      select_num = parseInt($('.detail').index(this))
      if $('.detail').eq(select_num).hasClass("selected")
        $('.detail').eq(select_num).removeClass("selected")
      else
        $('.detail').eq(select_num).addClass("selected")
      event.preventDefault()

  #行削除
  $(document)
    .on "click",".removeList" ,  (event)->
      #未選択はエラー
      if $('.selected').length == 0
        alert "明細が未選択です。"
        return
      $(".selected" ).children("input[name*='_destroy']").val('1')
      $('.selected').closest('fieldset').hide()
      $.update_index()  #index編集
      event.preventDefault()

  #行追加
  $(document)
    .on "click",".addList" , (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      console.log($('.detail').length)
      if $('.detail').length == 0
        $('.field').last().after($(this).data('fields').replace(regexp, time))
      else
        $('.detail').last().after($(this).data('fields').replace(regexp, time))
      $.update_index()  #index編集
      event.preventDefault()

  #行上移動
  $(document)
    .on "click",".upList" ,  ->
      #未選択はエラー
      if $('.selected').length == 0
        alert "明細が未選択です。"
        return
      #複数選択はエラー
      if $('.selected').length > 2
        alert "複数選択での操作は行えません。"
        return
      #行の上移動
      work_tr = $('.selected')
      $(work_tr).insertBefore($(work_tr).prev("tr").prev("tr")[0])
      $.update_index()  #index編集

  #行下移動
  $(document)
    .on "click",".downList" ,  ->
      #未選択はエラー
      if $('.selected').length == 0
        alert "明細が未選択です。"
        return
      #複数選択はエラー
      if $('.selected').length > 2
        alert "複数選択での操作は行えません。"
        return
      #行の下移動
      work_tr = $('.selected')
      $(work_tr).insertAfter($(work_tr).next("tr").next("tr")[1])
      $.update_index()  #index編集


  #貸付明細のindexを編集
  $.update_index = () ->
    display_idx = 0
    $('#R0541AB0702>tbody>tr').each (idx) ->
      #偶数行のみ処置（0から始まる）
      if idx % 2 == 0
        display_idx += 1
        $(this).find("#td-idx").html(display_idx)
