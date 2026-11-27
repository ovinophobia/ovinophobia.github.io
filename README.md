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
| 今日大学习 | `docs/journey/study/index.md` |
| 随记 | `docs/journey/notes/index.md` |
| 足迹 | `docs/journey/footprints/index.md` |
| 歌词列表 | `docs/lyrics/index.md` |
| God Knows 歌词与假名注音 | `docs/lyrics/god-knows.md` |
| 友情链接 | `docs/friends/index.md` |
| 自我介绍 | `docs/about/index.md` |
| 字号、颜色和页面布局 | `docs/stylesheets/extra.css` |

网站名称现在是 `ovino`；主页中央显示的是按要求保留的“我的网站名称”，两者可以分别修改。

## 填写课程模板

“课程”已分为“专业课程”“通识课程”“其他”三个栏目。13 门课程的独立文件均已建好。

| 课程 | 文件 |
| --- | --- |
| 生物医学信号处理 | `docs/course/major/biomedical-signal-processing.md` |
| 生物医学成像技术 | `docs/course/major/biomedical-imaging.md` |
| 嵌入式系统 | `docs/course/major/embedded-systems.md` |
| 高级程序设计 | `docs/course/major/advanced-programming.md` |
| 生物医学传感与检测 | `docs/course/major/biomedical-sensing-and-detection.md` |
| 生物医学图像处理 | `docs/course/major/biomedical-image-processing.md` |
| 仪器系统设计 | `docs/course/major/instrument-system-design.md` |
| 硬件描述语言 | `docs/course/major/hardware-description-language.md` |
| 电子系统设计与实践 | `docs/course/major/electronic-system-design-and-practice.md` |
| 模式识别与机器学习基础 | `docs/course/major/pattern-recognition-and-machine-learning.md` |
| 生产实习 | `docs/course/major/production-internship.md` |
| 毛概 | `docs/course/general/mao-gai.md` |
| 习概 | `docs/course/general/xi-gai.md` |

用文本编辑器打开对应文件，把“待填写”“待补充”替换成自己的内容。开头依次是任课教师、学分、课程类别、成绩、学期，随后填写课程总结、建议与教师评价，末尾整理相关资料。

已有课程只需要修改正文；保存后可双击 `start-preview.cmd` 预览，再双击 `upload.cmd` 提交并上传。

## 新增课程文章

所有新文章末尾都应使用统一的返回区域：上方有细分隔线，链接下方留有空白。可以复制 `templates/article.md` 到对应栏目文件夹中再填写正文。

```markdown
[返回所属栏目](index.md)
{ .article-backlink }
```

属性行 `{ .article-backlink }` 必须紧接链接行，不要在两行之间加空行。链接路径按文章位置填写；分隔线和底部空白由样式自动生成，不必再加 `---`。这条规则也已记录在项目根目录的 `AGENTS.md`，以后生成文章时遵循。

1. 根据分类打开 `docs/course/major`、`docs/course/general` 或 `docs/course/other` 文件夹。
2. 选中一篇课程文件，按 `Ctrl+C`，再按 `Ctrl+V` 复制一份；“其他”分类也可以复制任意已有课程文件后修改。
3. 选中副本，按 `F2`，改名为 `lesson-01.md`，保留 `.md` 后缀。
4. 用文本编辑器打开新文件，修改标题和内容，按 `Ctrl+S` 保存。
5. 打开同一分类文件夹里的 `index.md`，在列表下面增加一行：

   ```markdown
   - [我的第一课](lesson-01.md) — 这一课的简单介绍。
   ```

6. 保存后，在浏览器点击“课程”并选择分类，即可通过列表进入新文章。如果还要把新文章放进左侧导航，需在 `mkdocs.yml` 的对应分类中增加一项；修改该配置后需要把 `mkdocs.yml` 单独提交。

Markdown 常用写法：`# 大标题`、`## 小标题`、`**加粗**`、`- 列表项目`、`[链接名称](网址)`。标题的井号和文字之间要留一个空格。

## 在“一路走来”中写文章

导航中的“一路走来”包含“今日大学习”“随记”“足迹”三个子栏目。

1. 根据内容打开 `docs/journey/study`（今日大学习）、`docs/journey/notes`（随记）或 `docs/journey/footprints`（足迹）。
2. 在对应文件夹中创建一篇 `.md` 文章，例如 `first-note.md`。可以复制一篇已有记录，再修改标题和正文。
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

### 双击上传网站内容

1. 写好文章或调整样式，保存文件。
2. 回到项目最外层目录 `D:\MY-website`，双击 `upload.cmd`（隐藏扩展名时显示为 `upload`）。
3. 脚本先检查网站能否正常构建。通过后，输入 `1` 并回车，使用提交说明 `daily update`；也可以直接回车。
4. 如果希望自己写说明，输入 `2` 并回车，再输入说明并回车。
5. 等窗口显示“代码已与 GitHub 同步”，按任意键关闭窗口。打开仓库的 **Actions**，等最新 **Publish MkDocs to GitHub Pages** 显示绿色对勾，再访问网站。

脚本会添加并提交 `docs` 中的文章、图片和样式改动，然后执行 `git push`。`mkdocs.yml` 等位于 `docs` 外的文件需要单独提交。`scripts/upload.ps1` 是启动文件依赖的实现，请一起保留。

如果没有新的内容改动，脚本会跳过创建提交，继续推送已有的本地提交。出错时窗口会保留错误提示，便于查看原因。

### 代码已推送，网站却没有更新

`Everything up-to-date` 仅表示代码已经同步，不表示网站发布成功，也不会重新触发之前失败的工作流。请打开仓库 **Actions**，查看最新发布任务是否出现红叉。

删除文章时，需要同时删除 `mkdocs.yml` 中对应的导航，以及其他文章里指向它的链接。脚本会在提交前运行 `mkdocs build --strict`，遇到构建错误就停止。

如果只是网络等临时问题，可以打开失败的工作流，点击 **Re-run all jobs** 重新运行。若是文件或配置错误，应先修复、提交并推送；新的提交会触发一次新的发布。

### 发布配置

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
