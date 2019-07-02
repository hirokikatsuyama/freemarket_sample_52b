  // // var src_img = document.getElementById("SrcImage");
  // // var dst_canvas = document.getElementById("DstCanvas");
  // // var dst_ctx = dst_canvas.getContext("2d");

  // // function run(){

  // //   // 元画像の描画
  // //   dst_canvas.width  = src_img.width;
  // //   dst_canvas.height = src_img.height;
  // //   dst_ctx.drawImage(src_img,0,0);

  // //   // ImageDataの生成
  // //   var source = dst_ctx.getImageData(0,0,dst_canvas.width,dst_canvas.height);

  // //   // エフェクトの実行
  // //   EffectGrayscale(source);

  // //   // canvasへ描画
  // //   dst_ctx.putImageData(source,0,0);
  // // }

  // var FLUITS = FLUITS || {};

  // FLUITS.PICKUP = {
  //   VECTOR_X: 1,
  //   VECTOR_Y: 1,
  //   IMG_PATH: 'img/fluits.jpg',
  //   IMG_SETTING: {
  //    background: false, //背面の柄消去
  //    modal:false, //背面のフィルター消去
  //    aspectRatio: this.VECTOR_X / this.VECTOR_Y // ここでアスペクト比の調整 ワイド画面にしたい場合は 16 / 9
  //   },
  //   init:function(){
  //    this.setParameters();
  //    this.bindEvent();
  //   },
  //   setParameters:function(){
  //    this.$imgDef = $('#img−default');
  //    this.$cutBtn = $('.jsc-cut-btn');
  //    this.$imgDef.cropper(this.IMG_SETTING);
  //    this.$cropperBorder = $('.cropper-crop-box');
  //    this.img = new Image();
  //    this.canvas = document.getElementById('jsi-canvas').getContext('2d');//お決まりの書き方なのでそのまま使用
  //   },

  //   bindEvent:function(){
  //    var self = this;

  //    this.$cropperBorder.on('mousemove', function() {　//動きを監視
  //     self.setImgParams();
  //    });
  //   },

  //   setImgParams:function(){
  //    var data = this.$imgDef.cropper('getData'); //getDataは用意されたオプション
  //    var imageData = {
  //     x: Math.round(data.x),
  //     y: Math.round(data.y),
  //     width: Math.round(data.width),
  //     height: Math.round(data.height),
  //     vectorX: this.VECTOR_X,
  //     vectorY: this.VECTOR_Y
  //    };
  //    this.drawImg(imageData);
  //   },

  //   drawImg:function(data){
  //    this.img.src = this.IMG_PATH;
  //    this.canvas.drawImage(
  //     this.img,
  //     data['x'],
  //     data['y'],
  //     data['width'],
  //     data['height'],
  //     0,0,//切り出されるCanvas内での座標指定
  //     data['vectorX']*120, //切り出される画像の横幅
  //     data['vectorY']*120　//切り出される画像の縦幅
  //    );
  //   }
  // }
  // $(function(){
  // 　FLUITS.PICKUP.init();
  // });
