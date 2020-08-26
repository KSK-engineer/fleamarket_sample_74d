$(function(){
  //画像ファイルプレビュー表示のイベント追加 imageを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="image"]', function(e) {
    var image = e.target.images[0],
        reader = new ImageReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(image.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(image) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: image.name
              }));
      };
    })(image);

    reader.readAsDataURL(image);
  });
});
