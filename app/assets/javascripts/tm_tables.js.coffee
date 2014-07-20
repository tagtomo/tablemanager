jQuery ->
  #行選択
  $(document)
    .on "click" ,".detail",  (event)->
      #選択(click)した明細へクラスを追加する
      select_num = parseInt($('.detail').index(this))
      if $('.detail').eq(select_num).hasClass("selected")
        $('.detail').eq(select_num).removeClass("selected")
      else
        $('.detail').eq(select_num).addClass("selected")
      #event.preventDefault()

  #行削除
  $(document)
    .on "click",".removeList" ,  (event)->
      #未選択はエラー
      if $('.selected').length == 0
        alert "明細が未選択です。"
        return
      #console.log($('.selected').children("input[name*='_destroy']"))
      $('.selected').children("input[name*='_destroy']").val('1')
      $('.selected').closest('tr').hide()
      $('.selected').addClass("deleted")
      $('.selected').removeClass("selected") #削除明細は選択を解除
      $.update_index()  #index編集
      event.preventDefault()

  #行追加
  $(document)
    .on "click",".addList" , (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      console.log($('.detail').length)
      if $('.detail').length == 0
        $('.detail_label').after($(this).data('fields').replace(regexp, time))
      else
        $('.detail').last().after($(this).data('fields').replace(regexp, time))
      $.update_index()  #index編集
      event.preventDefault()

  #行上移動
  $(document)
    .on "click",".upList" ,   (event)->
      #未選択はエラー
      if $('.selected').length == 0
        alert "明細が未選択です。"
        return
      #複数選択はエラー
      if $('.selected').length > 2
        alert "複数選択での操作は行えません。"
        return
      console.log($('.selected').length)
      #行の上移動
      $('.selected').insertBefore($('.selected').prev())
      $.update_index()  #index編集
      event.preventDefault()

  #行下移動
  $(document)
    .on "click",".downList" ,   (event)->
      #未選択はエラー
      if $('.selected').length == 0
        alert "明細が未選択です。"
        return
      #複数選択はエラー
      if $('.selected').length > 2
        alert "複数選択での操作は行えません。"
        return
      console.log($('.selected').length)
      #行の下移動
      $('.selected').insertAfter($('.selected').next())
      $.update_index()  #index編集
      event.preventDefault()


  #明細のindexを編集
  $.update_index = () ->
    display_idx = 0
    #console.log($('.detail'))
    $('.detail').each (idx) ->
      display_idx += 1
      #console.log($(this).find('.detail_no').children().val())
      $(this).find('.detail_no').children().val(display_idx)

  #scaffold用gendata取得
  $(document)
    .on "click",".getgentext" ,   (event)->
      url = location.href　+'/getgentext'
      #console.log(url)
      console.log($("pre#targetpre").html())
      console.log($("code#targetcode").text())
      #Restcall
      $.ajax(
        url: url,
        type: 'get',
        async: false,
        success: (text) ->
          $("code#targetcode").text(text)
        error: (XMLHttpRequest, textStatus, errorThrown) ->
          alert(XMLHttpRequest + " " + textStatus)
      )
  #locale用yml取得
  $(document)
    .on "click",".getlocaleyml" ,   (event)->
      url = location.href　+'/getlocaleyml'
      #console.log(url)
      #Restcall
      $.ajax(
        url: url,
        type: 'get',
        async: false,
        success: (text) ->
          $("code#targetcode").text(text)
        error: (XMLHttpRequest, textStatus, errorThrown) ->
          alert(XMLHttpRequest + " " + textStatus)
      )
