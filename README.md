# lucky-mpd

A minimal Docker setup for running [MPD](https://www.musicpd.org/) with ALSA audio output.

The container is designed to run on a Raspberry Pi with access to the host's audio device.

Work great with [lucky-radio-api](https://github.com/12LuckyDev/lucky-radio-api) and the [lucky-mpd](https://github.com/12LuckyDev/lucky-mpd).

## Build

The image is intended to run on a Raspberry Pi using `linux/arm64`.

On Windows, make sure Docker Desktop is running and build the image with:

```bash
docker buildx build --platform linux/arm64 -t lucky-mpd:latest --load .
```

Or use:

```text
build.bat
```

The script builds the ARM64 image and exports it as:

```text
lucky-mpd.tar
```

## Deploy to Raspberry Pi

Copy the image to the Raspberry Pi:

```bash
scp lucky-mpd.tar pi@raspberry:/tmp/
```

Load the image:

```bash
docker load -i /tmp/lucky-mpd.tar
```

Then start the container:

```bash
docker compose up -d
```

## Audio

The container requires access to the Raspberry Pi audio device:

```yaml
devices:
  - /dev/snd:/dev/snd
```

MPD uses ALSA for audio output.

## Ports

MPD listens on port `6600`.

If remote MPD clients need to connect, expose the port in `compose.yml`:

```yaml
ports:
  - "6600:6600"
```
