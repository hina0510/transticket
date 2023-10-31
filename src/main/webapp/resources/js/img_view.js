function previewImages() {
    const previewContainer = document.getElementById('imagePreview');
    const files = document.getElementById('imageFiles').files;

    previewContainer.innerHTML = ''; // 기존 미리보기 삭제

    for (const file of files) {
        const reader = new FileReader();
        const image = document.createElement('img');
        image.classList.add('preview-image');

        reader.onload = function (e) {
            const img = new Image();
            img.src = e.target.result;
            img.onload = function () {
                const canvas = document.createElement('canvas');
                const ctx = canvas.getContext('2d');

                // 이미지 크기를 100x100으로 조절
                canvas.width = 100;
                canvas.height = 100;
                ctx.drawImage(img, 0, 0, 100, 100);

                // Canvas를 이미지로 변환하여 설정
                image.src = canvas.toDataURL('image/jpeg');

                // 미리보기 컨테이너에 추가
                previewContainer.appendChild(image);
            };
        };

        reader.readAsDataURL(file);
    }
}