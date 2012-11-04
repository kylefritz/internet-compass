

(function() {
  var updateIcon;

  updateIcon = function() {
    var canvas, context, imageData;
    canvas = document.createElement('canvas');
    canvas.height = 19;
    canvas.width = 19;
    context = canvas.getContext("2d");
    context.translate(9.5, 9.5);
    context.rotate(Math.PI * 2 * (Math.random() * 360));
    context.moveTo(0, -7.5);
    context.lineTo(7.5, 7.5);
    context.lineTo(-7.5, 7.5);
    context.lineTo(0, -7.5);
    context.strokeStyle = "#000";
    context.stroke();
    imageData = context.getImageData(0, 0, canvas.width, canvas.height);
    return window.chrome.browserAction.setIcon({
      imageData: imageData
    });
  };

  setInterval(updateIcon, 500);

  updateIcon();

}).call(this);
