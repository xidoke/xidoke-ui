# Giới thiệu
Phần này trình bày cách tham gia dự án, cũng như các hướng dẫn đơn giản để người đọc hiểu được workflow từ đó nâng cao hiệu quả làm việc từ một quy chuẩn được thống nhất.

# Workflow
Trước khi bắt đầu phát triển một tính năng mới hoặc thực hiện thay đổi, cần nhận thức rõ các điều sau:

*   **Changelog là dành cho con người**, không phải máy móc. Mục đích chính của nó là giúp người dùng và cộng tác viên dễ dàng nắm bắt **chính xác những thay đổi đáng chú ý** giữa các phiên bản của dự án.
*   Bạn có thể tham khảo thêm định dạng chuẩn được giới thiệu trong "Keep a Changelog" (https://keepachangelog.com/en/1.1.0/) và cách dự án này tuân thủ [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Viết Changelog (cho phần `Unreleased`)
Việc viết changelog nên được thực hiện trước, đặc biệt là cho phần `Unreleased` (chưa phát hành). Điều này mang lại hai lợi ích:
*   Người dùng có thể thấy trước những thay đổi dự kiến trong các bản phát hành sắp tới.
*   Khi phát hành, bạn có thể dễ dàng chuyển các thay đổi từ phần `Unreleased` vào mục phiên bản mới.

**Khi viết changelog, hãy đảm bảo các điểm sau:**
*   **Chỉ ghi lại những thay đổi đáng chú ý và quan trọng**. Tránh việc sao chép toàn bộ commit log, vì chúng thường chứa nhiều "nhiễu" như các commit hợp nhất (merge commits), commit có tiêu đề không rõ ràng, hoặc thay đổi tài liệu, v.v.. Mục đích của commit là ghi lại một bước trong quá trình phát triển mã nguồn, trong khi mục đích của changelog là truyền đạt rõ ràng những khác biệt đáng chú ý cho người dùng cuối.
*   **Phân loại các thay đổi theo nhóm** để dễ đọc và dễ hiểu. Các loại thay đổi được khuyến nghị bao gồm:
    *   **Added**: Cho các tính năng mới được thêm vào.
    *   **Changed**: Cho các thay đổi trong chức năng hiện có.
    *   **Deprecated**: Cho các tính năng sẽ sớm bị loại bỏ. Việc liệt kê rõ ràng các tính năng bị bỏ đi là cực kỳ quan trọng để người dùng biết khi nào một thứ gì đó sẽ ngừng hoạt động. Họ nên có khả năng nâng cấp lên phiên bản liệt kê các deprecation, loại bỏ chúng, sau đó nâng cấp lên phiên bản mà các deprecation đó đã bị loại bỏ hoàn toàn.
    *   **Removed**: Cho các tính năng đã bị loại bỏ.
    *   **Fixed**: Cho bất kỳ lỗi nào đã được sửa.
    *   **Security**: Trong trường hợp có các lỗ hổng bảo mật.
*   **Mỗi phiên bản phải có một mục riêng trong changelog**.
*   **Các phiên bản và các phần nên có khả năng liên kết** (linkable).
*   **Phiên bản mới nhất phải được liệt kê đầu tiên** (thứ tự thời gian đảo ngược).
*   **Ngày phát hành của mỗi phiên bản phải được hiển thị**. **Định dạng ngày được khuyến nghị là ISO 8601 (YYYY-MM-DD)**, ví dụ: `2017-07-17`. Định dạng này giúp tránh nhầm lẫn về thứ tự tháng và ngày, và được sắp xếp từ đơn vị lớn nhất đến nhỏ nhất (năm, tháng, ngày).
*   **Đảm bảo rằng bạn tuân theo Semantic Versioning** (MAJOR.MINOR.PATCH).
    *   **MAJOR**: Các thay đổi không tương thích ngược (breaking changes), ví dụ:
        *   **Đổi API hoặc breaking UI**: (như thay đổi API của button, đổi rule gây breaking, đổi/remove hàm utils,...) [3 - Changed, Removed, Deprecated].
    *   **MINOR**: Thêm chức năng mới có tương thích ngược, ví dụ:
        *   **Thêm UI** mới [3 - Added].
        *   **Thêm package** mới [3 - Added].
        *   **Thêm cấu hình mới** (như tailwind, ts) [3 - Added].
    *   **PATCH**: Sửa lỗi có tương thích ngược, ví dụ:
        *   **Sửa bug trong component** [3 - Fixed].
        *   **Các bug nhỏ khác** [3 - Fixed].
*   Khi có nhiều ý tưởng, nên sắp xếp chúng theo nhóm và tách nhỏ version. Không nhất thiết buộc mỗi branch sẽ là 1 tag, nhưng mỗi một tag nhỏ nên tập trung vào một vài thay đổi liên quan.
*   **Tránh sử dụng GitHub Releases như một changelog chính thức duy nhất** vì chúng tạo ra một changelog không di động (non-portable) và chỉ có thể hiển thị trong ngữ cảnh của GitHub. Các file changelog truyền thống (như `CHANGELOG.md`) dễ tìm kiếm và truy cập hơn.
*   **Tên file changelog nên là `CHANGELOG.md`**. Mặc dù có các tên khác như `HISTORY`, `NEWS`, hoặc `RELEASES`, nhưng việc sử dụng một tên thống nhất giúp người dùng dễ dàng tìm thấy các thay đổi đáng chú ý.
*   **Liệt kê các bản phát hành đã bị "yanked"** (đã bị gỡ bỏ do lỗi nghiêm trọng hoặc vấn đề bảo mật), và đánh dấu chúng rõ ràng bằng thẻ `[YANKED]` để người dùng nhận biết. Ví dụ: `## [0.0.5] - 2014-12-13 [YANKED]`.

### Công cụ
*   Chuyển sang dùng Changesets.