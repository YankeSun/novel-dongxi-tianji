#!/bin/bash
# 重建小说 Git 提交历史

cd /tmp/novel-clean

git branch -m master main

# 初始提交：README
git add README.md
git commit -m "初始化：小说仓库建立

- 创建 README.md
- 设置目录结构
- 准备连载《洞悉天机三千年一不小心无敌了》"

# 按章节顺序提交
for i in $(seq 11 25); do
    chapter_file="novels/洞悉天机三千年一不小心无敌了/第 ${i} 章.md"
    if [ -f "$chapter_file" ]; then
        # 从章节文件中提取标题
        title=$(head -1 "$chapter_file" | sed 's/# //')
        
        git add "$chapter_file"
        git commit -m "第 ${i} 章：${title}"
        echo "✅ 提交第 ${i} 章"
    fi
done

echo ""
echo "📚 提交历史重建完成！"
git log --oneline
