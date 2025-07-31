Trong React (và TypeScript nói chung), việc chọn giữa `type` và `interface` có thể gây bối rối. Dưới đây là hướng dẫn ngắn gọn và dễ hiểu để bạn biết khi nào nên dùng cái nào:

---

## 🎯 Khi nào dùng `interface`?

* **Mô tả props, state, context trong React component**

  ```tsx
  interface Props {
    name: string;
    age?: number;
  }

  const MyComponent: React.FC<Props> = ({ name, age }) => {
    return <div>{name}</div>;
  };
  ```

* **Bạn muốn mở rộng (extend)**

  ```ts
  interface A {
    id: number;
  }

  interface B extends A {
    name: string;
  }
  ```

* **Bạn dùng nhiều file và muốn các type có thể được merge lại (declaration merging)**
  → Chỉ `interface` hỗ trợ tính năng này.

---

## 🧱 Khi nào dùng `type`?

* **Khi cần union, intersection, conditional types, utility types**

  ```ts
  type Status = 'loading' | 'success' | 'error';

  type User = {
    id: string;
  } & {
    name: string;
  };
  ```

* **Khi cần alias cho primitive, tuple, array, function**

  ```ts
  type Name = string;
  type Point = [number, number];
  type ClickHandler = (e: React.MouseEvent<HTMLButtonElement>) => void;
  ```

* **Khi bạn không cần kế thừa hoặc mở rộng về sau**

---

## ✍️ Tóm tắt gọn:

| Tình huống                                | Dùng gì?                         | Lý do                                        |                   |
| ----------------------------------------- | -------------------------------- | -------------------------------------------- | ----------------- |
| React Props/State                         | `interface` hoặc `type` đều được | Nhưng `interface` phổ biến hơn vì dễ mở rộng |                   |
| Nối type với `&` (intersection)           | `type`                           | Dễ kết hợp nhiều kiểu                        |                   |
| Union type (\`A                           | B\`)                             | `type`                                       | Chỉ `type` hỗ trợ |
| Cần kế thừa và mở rộng                    | `interface`                      | Có cú pháp `extends` rõ ràng                 |                   |
| Dùng cho array, tuple, function           | `type`                           | Gọn và rõ ràng hơn                           |                   |
| Cần merge nhiều lần (declaration merging) | `interface`                      | `type` không làm được điều này               |                   |

---

## 🧠 Best Practice (gợi ý cá nhân):

* Dùng `interface` cho React props để dễ mở rộng và quen thuộc hơn với cộng đồng.
* Dùng `type` khi cần combine, union, tuple, alias function... hoặc viết code dạng functional nhiều.

---

Nếu bạn cho mình ví dụ cụ thể bạn đang làm, mình có thể gợi ý trực tiếp nên dùng `type` hay `interface`.
