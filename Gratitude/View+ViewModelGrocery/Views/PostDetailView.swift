
import SwiftUI

struct PostDetailView: View {
    var post: Post  // 接收一个 Post 类型的对象

    var body: some View {
        VStack(spacing: 16) {  // 使用 VStack 布局来显示帖子详细信息
            Text(post.title)  // 显示帖子标题
                .font(.largeTitle)  // 大字体
                .padding()

            Text(post.body)  // 显示帖子正文
                .font(.body)  // 正文字体
                .padding()

            Spacer()  // 用于推送内容到上方，底部留白
        }
        .navigationTitle("Post Detail")  // 设置导航标题
        .navigationBarTitleDisplayMode(.inline)  // 标题显示模式
        .toolbar {  // 自定义工具条
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {  // 返回按钮
                    // 如果使用的 NavigationStack，自动处理返回
                }
            }
        }
    }
}
