Để chạy được source ở trên, đầu tiên là mở notebook bằng colab. 
Quá trình huấn luyện.
- Bước 1: Clone source từ github về.
- Bước 2: Cài đặt cài thư viện cần thiết
- Bước 3: Kết nối drive để lấy dữ liệu.
- Bước 4: Tạo thư mục dataset trong thư mục của source. (conten/patchcore-inspection/mvtec)
- Bước 5: set PYTHONPATH
- Bước 6: Trong file sample_training.sh có chứa các thông tin để chạy quá trình huấn luyện. Các thông tin cần thay đổi khi dùng dataset khác nhau.
        + datapath: đường dẫn đến dataset
        + datasets: danh sách các class trong dataset
        + ở dưới có các dòng lệnh, dùng mô hình nào thì mở comment cho dòng đó.
- Bước 7: vào file run_patchcore.py trong "bin" và thay đổi _DATASETS  cho đúng với bộ dataset mong muốn đào tạo.
- Bước 8: Vào patchcore-inspection/src/patchcore/patchcore.py, mở comment dòng 104-111 khi muốn sử dụng backbone vision transformer. ( Nếu dùng WideResNet50 thì giữ nguyên).
        + Với Deit, đóng comment dòng 109.
        + Với Vit, dóng comment dòng 107.
- Bước 9: Quay lại notebook và run "!bash patchcore-inspection/sample_training.sh"

Quá trình kiểm thử.
- Bước 1: vào file load_and_evaluate_patchcore.py trong "bin" và thay đổi _DATASETS  cho đúng với bộ dataset mong muốn kiểm thử.
- Bước 2: vào sample_evaluation.sh, thay đổi các thông tin tương tự mẫu có sẵn trong file để kiểm thử mô hình vừa đào tạo.
- Bước 3: Quay lại notebook và run "!bash patchcore-inspection/sample_evaluation.sh"
