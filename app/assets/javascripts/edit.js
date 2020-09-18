"use strict";
$(function(){
  $(".category-wrapper__category").change(function (){
    let parentValue = $(".category-wrapper__category").val();
    if (parentValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function () {
        $("#c_category").remove("");
        $("#gc_category").remove("");
        })
      .fail(function () {
        alert("通信エラーです！");
      });
    }
  })
  $(".child_category_id").change(function (){
    let childValue = $(".child_category_id").val();
    if (childValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        data: { children_id: childValue },
        dataType: 'json'
      })
      .done(function () {
        $("#gc_category").remove("");
        })
      .fail(function () {
        alert("通信エラーです！");
      });
    }
  })
  $(".js-remove").on('click', function(){
    const num = $(this).data("index");
    console.log(num)
    $(`#item_images_attributes_${num}__destroy`).prop('checked', true);
    $(`img[data-index="${num}"]`).remove();
  })
})