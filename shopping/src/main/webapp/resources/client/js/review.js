document.addEventListener('DOMContentLoaded', () => {
    // Xử lý đánh giá sao
    const stars = document.querySelectorAll('.star');
    const ratingText = document.getElementById('rating-text');
    const ratingInput = document.getElementById('rating-input');
    const ratingDescriptions = [
        'Chọn số sao',
        'Tệ',
        'Tạm được',
        'Bình thường',
        'Tốt',
        'Tuyệt vời'
    ];

    // Tự động chọn 5 sao khi trang được tải
    const defaultRating = 5;
    stars.forEach((star, index) => {
        if (index < defaultRating) {
            star.classList.add('active');
        }
    });
    ratingText.textContent = ratingDescriptions[defaultRating];
    ratingInput.value = defaultRating; // Đặt giá trị mặc định cho rating-input

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const value = parseInt(star.getAttribute('data-value'));
            stars.forEach(s => s.classList.remove('active'));
            for (let i = 0; i < value; i++) {
                stars[i].classList.add('active');
            }
            ratingText.textContent = ratingDescriptions[value];
            ratingInput.value = value; // Cập nhật giá trị rating-input khi người dùng chọn sao
        });
    });

    // Xử lý tải lên hình ảnh
    const imageUpload = document.getElementById('image-upload');
    const imageUploadMore = document.getElementById('image-upload-more');
    const imagePreview = document.getElementById('image-preview');
    let imageFiles = [];

    const updateImagePreview = async () => {
        // Xóa nội dung hiện tại (trừ nút "Thêm")
        imagePreview.innerHTML = '';

        // Tạo danh sách Promise để đọc các file ảnh
        const imagePromises = imageFiles.map((file, index) => {
            return new Promise((resolve) => {
                const reader = new FileReader();
                reader.onload = (e) => {
                    const thumbnail = document.createElement('div');
                    thumbnail.classList.add('thumbnail');
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    thumbnail.appendChild(img);
                    const removeBtn = document.createElement('button');
                    removeBtn.classList.add('remove-btn');
                    removeBtn.innerHTML = '×';
                    removeBtn.addEventListener('click', () => {
                        imageFiles.splice(index, 1);
                        updateImagePreview();
                    });
                    thumbnail.appendChild(removeBtn);
                    imagePreview.appendChild(thumbnail);
                    resolve();
                };
                reader.readAsDataURL(file);
            });
        });

        // Chờ tất cả ảnh được xử lý
        await Promise.all(imagePromises);

        // Thêm nút "Thêm" nếu chưa đạt giới hạn
        if (imageFiles.length < 5) {
            const addMore = document.createElement('div');
            addMore.classList.add('add-more');
            addMore.innerHTML = '<i class="fas fa-camera"></i>';
            const input = document.createElement('input');
            input.type = 'file';
            input.accept = 'image/*';
            input.multiple = true;
            input.style.display = 'none';
            input.addEventListener('change', (e) => {
                const newFiles = Array.from(e.target.files);
                if (imageFiles.length + newFiles.length <= 5) {
                    imageFiles = [...imageFiles, ...newFiles];
                    updateImagePreview();
                } else {
                    alert('Bạn chỉ có thể tải lên tối đa 5 hình ảnh.');
                }
            });
            addMore.appendChild(input);
            addMore.addEventListener('click', () => input.click());
            imagePreview.appendChild(addMore);
        }
    };

    imageUpload.addEventListener('change', (e) => {
        const newFiles = Array.from(e.target.files);
        if (imageFiles.length + newFiles.length <= 5) {
            imageFiles = [...imageFiles, ...newFiles];
            updateImagePreview();
        } else {
            alert('Bạn chỉ có thể tải lên tối đa 5 hình ảnh.');
        }
    });

    // Xử lý tải lên video
    const videoUpload = document.getElementById('video-upload');
    const videoUploadMore = document.getElementById('video-upload-more');
    const videoPreview = document.getElementById('video-preview');
    let videoFiles = [];

    const updateVideoPreview = async () => {
        // Xóa nội dung hiện tại (trừ nút "Thêm")
        videoPreview.innerHTML = '';

        // Tạo danh sách Promise để đọc các file video
        const videoPromises = videoFiles.map((file, index) => {
            return new Promise((resolve) => {
                const reader = new FileReader();
                reader.onload = (e) => {
                    const thumbnail = document.createElement('div');
                    thumbnail.classList.add('thumbnail');
                    const video = document.createElement('video');
                    video.src = e.target.result;
                    video.controls = false;
                    thumbnail.appendChild(video);
                    const removeBtn = document.createElement('button');
                    removeBtn.classList.add('remove-btn');
                    removeBtn.innerHTML = '×';
                    removeBtn.addEventListener('click', () => {
                        videoFiles.splice(index, 1);
                        updateVideoPreview();
                    });
                    thumbnail.appendChild(removeBtn);
                    videoPreview.appendChild(thumbnail);
                    resolve();
                };
                reader.readAsDataURL(file);
            });
        });

        // Chờ tất cả video được xử lý
        await Promise.all(videoPromises);

        // Thêm nút "Thêm" nếu chưa đạt giới hạn
        if (videoFiles.length < 1) {
            const addMore = document.createElement('div');
            addMore.classList.add('add-more');
            addMore.innerHTML = '<i class="fas fa-video"></i>';
            const input = document.createElement('input');
            input.type = 'file';
            input.accept = 'video/mp4';
            input.style.display = 'none';
            input.addEventListener('change', (e) => {
                const newFiles = Array.from(e.target.files);
                if (videoFiles.length + newFiles.length <= 1) {
                    videoFiles = [...videoFiles, ...newFiles];
                    updateVideoPreview();
                } else {
                    alert('Bạn chỉ có thể tải lên tối đa 1 video.');
                }
            });
            addMore.appendChild(input);
            addMore.addEventListener('click', () => input.click());
            videoPreview.appendChild(addMore);
        }
    };

    videoUpload.addEventListener('change', (e) => {
        const newFiles = Array.from(e.target.files);
        if (videoFiles.length + newFiles.length <= 1) {
            videoFiles = [...videoFiles, ...newFiles];
            updateVideoPreview();
        } else {
            alert('Bạn chỉ có thể tải lên tối đa 1 video.');
        }
    });
});