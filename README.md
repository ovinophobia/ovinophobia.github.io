# ovino 个人网站使用说明

这是一个使用 MkDocs 和 Material 主题制作的中文个人网站。

## 打开本地预览

1. 在文件资源管理器中打开 `D:\MY-website` 文件夹。
2. 双击 `start-preview.cmd`。如果文件扩展名被隐藏，看到的名称可能是 `start-preview`。
3. 等窗口显示 `Serving on http://127.0.0.1:8000/`，在浏览器地址栏输入 `http://127.0.0.1:8000/`，按回车。
4. 预览期间保持命令窗口打开。停止预览时，点一下命令窗口，按 `Ctrl+C`；若询问是否终止，输入 `Y` 并按回车。

如果已有预览在运行，直接打开网址即可，不需要重复双击。这个地址是本机预览地址，尚未发布到互联网。

## 修改内容

用文本编辑器打开下面的文件，修改文字并保存；预览通常会自动刷新。

| 想修改的内容 | 对应文件 |
| --- | --- |
| 网站名称、导航和主题 | `mkdocs.yml` |
| 主页中央的大字 | `docs/index.md` 中的“我的网站名称” |
| 课程简介和文章列表 | `docs/course/index.md` |
| 示例课程文章 | `docs/course/example.md` |
| 今日大学习 | `docs/journey/study/index.md` |
| 随记 | `docs/journey/notes/index.md` |
| 足迹 | `docs/journey/footprints/index.md` |
| 友情链接 | `docs/friends/index.md` |
| 自我介绍 | `docs/about/index.md` |
| 字号、颜色和页面布局 | `docs/stylesheets/extra.css` |

网站名称现在是 `ovino`；主页中央显示的是按要求保留的“我的网站名称”，两者可以分别修改。

## 新增课程文章

1. 打开 `docs\course` 文件夹。
2. 选中 `example.md`，按 `Ctrl+C`，再按 `Ctrl+V` 复制一份。
3. 选中副本，按 `F2`，改名为 `lesson-01.md`，保留 `.md` 后缀。
4. 用文本编辑器打开新文件，修改标题和内容，按 `Ctrl+S` 保存。
5. 打开 `docs/course/index.md`，在文章列表下面增加一行：

   ```markdown
   - [我的第一课](lesson-01.md) — 这一课的简单介绍。
   ```

6. 保存后，在浏览器点击“课程”，即可通过文章列表进入新文章。

Markdown 常用写法：`# 大标题`、`## 小标题`、`**加粗**`、`- 列表项目`、`[链接名称](网址)`。标题的井号和文字之间要留一个空格。

## 在“一路走来”中写文章

导航中的“一路走来”包含“今日大学习”“随记”“足迹”三个子栏目。

1. 根据内容打开 `docs/journey/study`（今日大学习）、`docs/journey/notes`（随记）或 `docs/journey/footprints`（足迹）。
2. 在对应文件夹中创建一篇 `.md` 文章，例如 `first-note.md`。可以复制课程的 `example.md`，再修改内容。
3. 打开同一文件夹里的 `index.md`，把等待第一篇内容的占位文字换成文章链接，例如 `- [我的第一篇记录](first-note.md)`。
4. 保存后查看本地预览。提交并推送到 GitHub 后，线上网站会自动更新。

## 如果以后需要重新安装环境

在网站文件夹顶部的地址栏输入 `powershell` 并按回车，依次输入下面三行，每行输入后按回车：

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m mkdocs serve
```

如果提示端口 8000 被占用，可以先关闭之前的预览窗口，或者运行：

```powershell
.\.venv\Scripts\python.exe -m mkdocs serve --dev-addr 127.0.0.1:8001
```

这时浏览器改为打开 `http://127.0.0.1:8001/`。

## 发布到 GitHub Pages

GitHub 仓库：https://github.com/ovinophobia/ovinophobia.github.io

发布成功后的网站地址：https://ovinophobia.github.io/

`.github/workflows/ci.yml` 会在每次推送到 `main` 分支时自动安装依赖、检查构建，再把生成的网站发布到 `gh-pages` 分支。也可以在 GitHub 仓库的 Actions 页面手动运行工作流。

首次推送后，按以下步骤配置：

1. 打开 GitHub 仓库，点击顶部的 **Actions**。
2. 打开 **Publish MkDocs to GitHub Pages** 工作流，等本次运行显示绿色对勾。此时会创建 `gh-pages` 分支。
3. 点击仓库顶部的 **Settings**，再点击左侧的 **Pages**。
4. 在 **Build and deployment** 中，把 **Source** 设为 **Deploy from a branch**。
5. 在 **Branch** 下面选择 **gh-pages**，目录选择 **/ (root)**，点击 **Save**。
6. 等 GitHub Pages 部署完成。通常需要几分钟；GitHub 官方说明，推送后的更改最多可能需要 10 分钟发布。
7. 在 **Settings → Pages** 页面点击 GitHub 显示的网站链接。普通项目仓库通常使用 `https://用户名.github.io/仓库名/`；如果仓库名就是 `用户名.github.io`，地址则是 `https://用户名.github.io/`。

这里的 Source 应选 **Deploy from a branch**。工作流负责生成 `gh-pages` 分支，再由 GitHub Pages 从该分支发布。

以后修改网站后，提交并推送到 `main`，就会自动更新线上网站，无需重复设置 Pages。
