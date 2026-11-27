$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false)
[Console]::OutputEncoding = $utf8
$OutputEncoding = $utf8

try {
    Set-Location -LiteralPath (Split-Path -Parent $PSScriptRoot)
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw '没有找到 Git，请先安装 Git 后再试。'
    }
    if (-not (Test-Path -LiteralPath '.git')) {
        throw '没有找到当前项目的 Git 仓库，请把脚本保留在网站项目中。'
    }

    Write-Host '=== 网站内容上传 ===' -ForegroundColor Cyan
    Write-Host '本次上传 docs 文件夹中的文章、图片和样式改动。'
    Write-Host ''

    Write-Host '[1/4] 检查网站能否正常生成……'
    $sitePython = Join-Path (Get-Location) '.venv\Scripts\python.exe'
    if (-not (Test-Path -LiteralPath $sitePython)) {
        throw '没有找到网站的 Python 环境，请按照 README.md 中“重新安装环境”的步骤安装后再运行。'
    }
    & $sitePython -m mkdocs build --strict
    if ($LASTEXITCODE -ne 0) {
        throw '网站检查未通过，本次尚未提交或推送。请先修复上面的错误或 WARNING；删除文章后，也要删除 mkdocs.yml 中对应的导航。'
    }

    Write-Host ''
    Write-Host '1. 使用提交说明：daily update（直接回车也选这一项）'
    Write-Host '2. 自己输入提交说明'

    do {
        $choice = (Read-Host '请选择 1 或 2').Trim()
        if ($choice -eq '') { $choice = '1' }
    } while ($choice -notin @('1', '2'))

    $message = 'daily update'
    if ($choice -eq '2') {
        do {
            $message = Read-Host '请输入本次提交说明（不能为空）'
        } while ([string]::IsNullOrWhiteSpace($message))
    }

    Write-Host ''
    Write-Host '[2/4] 添加 docs 中的改动……'
    & git add -- docs
    if ($LASTEXITCODE -ne 0) { throw '添加文件失败，已停止上传。请查看上面的 Git 提示。' }

    & git diff --cached --quiet -- docs
    $diffExit = $LASTEXITCODE
    if ($diffExit -eq 1) {
        Write-Host ('[3/4] 提交：' + $message)
        # 使用临时文件传递说明，保留中文、引号和特殊字符。
        $messageFile = [System.IO.Path]::GetTempFileName()
        try {
            [System.IO.File]::WriteAllText($messageFile, $message, $utf8)
            # 只提交 docs，保留其他文件已有的暂存状态。
            & git commit --only --file $messageFile -- docs
            if ($LASTEXITCODE -ne 0) { throw '提交失败，已停止上传。请查看上面的 Git 提示。' }
        }
        finally {
            if (Test-Path -LiteralPath $messageFile) {
                Remove-Item -LiteralPath $messageFile
            }
        }
    }
    elseif ($diffExit -eq 0) {
        Write-Host '[3/4] docs 没有新改动，跳过创建提交；继续推送已有提交。'
    }
    else {
        throw '检查文件改动失败，已停止上传。'
    }

    Write-Host '[4/4] 推送到 GitHub……'
    & git push
    if ($LASTEXITCODE -ne 0) {
        throw '推送失败。请查看上面的网络或登录提示，解决后重新运行脚本；已完成的本地提交会保留。'
    }

    Write-Host ''
    Write-Host '代码已与 GitHub 同步。网站是否更新，还需要检查自动发布结果。' -ForegroundColor Green
    Write-Host '发布状态：https://github.com/ovinophobia/ovinophobia.github.io/actions'
    Write-Host '最新 Publish MkDocs to GitHub Pages 显示绿色对勾后，再访问网站。'
    Write-Host '如果 Git 提示 Everything up-to-date，表示没有新代码需要上传，不会重新触发发布。'
    Write-Host '网站地址：https://ovinophobia.github.io/'
    exit 0
}
catch {
    Write-Host ''
    Write-Host ('上传未完成：' + $_.Exception.Message) -ForegroundColor Red
    exit 1
}
