# LUWebImage

  引入 Rango.framework  tableview 自定义展示数据
  
     1，图片缓存逻辑
     
     2，自适应高度
     
     3，点击ClickInfo.str  跳转 url
     
     
     主要实现逻辑：
     
     1 ，图片缓存逻辑 仿SDWebImage
     
     
     从网络获取图片 ->  检查内存缓存 -> 有 从内存加载图片
                          ↓
                    没有，检查沙盒缓存 -> 有  从沙盒加载图片 ，并拷贝一份在 内存上
                          ↓
                    没有，从网络加载  -> 有 写入沙盒 ，写入内存
                          ↓
                    没有，图片地址不对
     
     2，通过 boundingRectWithSize 计算高度
     3，通过 textView 添加 NSLinkAttributeName 添加跳转
