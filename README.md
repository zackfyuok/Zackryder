## Automatic Recording of M3U8 Live Streams Script

This Node.js script automatically monitors a specified M3U8 live stream and starts recording when the broadcast begins.

English / [简体中文](README_CN.md)

### Using Docker Compose

1. Clone this repository which includes the Docker Compose file `docker-compose.yml`:

```bash
git clone https://github.com/Giancarlo996/m3u8-auto-recorder.git
cd m3u8-auto-recorder
```

2. Edit the `M3U8_URL` environment variable in the Docker Compose file to set it to the M3U8 live stream URL you want to monitor and record.

3. Modify the mount directory in the Docker Compose file to attach a local directory to the container's `/data` directory. Example:

```yaml
volumes:
  # Mount the local directory /etc/recorder to the /data directory in the container
  - /etc/recorder:/data
```

4. Run Docker Compose to build and start the container:

```bash
docker-compose up --build
```

### Dependencies

- axios: Used for making HTTP requests to fetch M3U8 content.
- moment: Utilized for date and time handling.
- streamlink: Essential for recording live streams.

### Notes

- Ensure accurate configuration of the `M3U8_URL` environment variable.
- Successful recording of live streams requires Streamlink installation and setup.
- The timezone is already configured as Asia/Shanghai.

### Example

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
