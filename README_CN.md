## 自动录制 M3U8 直播流脚本

这个 Node.js 脚本可以自动监控指定的 M3U8 直播流，并在直播开始时进行录制。

[English](README.md) / 简体中文

### Docker Compose 使用方法

1. 克隆此存储库包含 Docker Compose 文件 `docker-compose.yml`：

```bash
git clone https://github.com/Giancarlo996/m3u8-auto-recorder.git
cd m3u8-auto-recorder
```

2. 编辑 Docker Compose 文件中的环境变量 `M3U8_URL`，设置为您要监控和录制的 M3U8 直播流地址。

3. 编辑 Docker Compose 文件中的挂载目录，将本地目录挂载到容器的 `/data` 目录。示例：

```yaml
volumes:
  # 将本地目录 /etc/recorder 挂载到容器的 /data 目录
  - /etc/recorder:/data
```

4. 运行 Docker Compose 构建并启动容器：

```bash
docker-compose up --build
```

### 依赖

- axios：用于发出 HTTP 请求以获取 M3U8 内容。
- moment：用于处理日期和时间。
- streamlink：用于录制直播流。

### 注意事项

- 请确保正确设置 `M3U8_URL` 环境变量。
- 您需要安装并配置 Streamlink 才能成功录制直播流。
- 时区已设置为 Asia/Shanghai。

### 示例

```yaml
version: "3"

services:
  recorder:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: m3u8AutoRecorder
    restart: always
    volumes:
      - /etc/recorder:/data
    environment:
      - INTERVAL_SECONDS=60
      - M3U8_URL=https://localhost/media/media.m3u8
      - TZ=Asia/Shanghai
```
