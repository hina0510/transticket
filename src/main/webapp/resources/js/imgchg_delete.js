function imgChg(input, previewId, imageHidden) {
    var preview = document.getElementById(previewId);
    var previewHidden = document.getElementById(imageHidden);
    var file = input.files[0];
    if (file) {
      var reader = new FileReader();
      reader.onload = function(e) {
        preview.src = e.target.result;
        previewHidden.value = '1';
        preview.width = 100;
        preview.height = 100;
      };
      reader.readAsDataURL(file);
    } else {
      preview.src = "imgView?name=${dto.imageName1}"; 
      preview.width = 100;
      preview.height = 100;
    }
  }
  
  function deleteImage(image, imageHidden) {
      var preview = document.getElementById(image);
      var previewHidden = document.getElementById(imageHidden);
      preview.src = "/root/resources/images/nan.png";
      previewHidden.value = 'nan';
      console.log("asd", previewHidden.value)
      console.log("/root/resources/images/nan.png")
  }