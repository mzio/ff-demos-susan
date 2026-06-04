# ff-demos-susan

A temporary one-page site — written as a short blog post / notes — on
**flawed-flowed**: agentic AI for consumers, a personal assistant that doesn't
just *read* the world to answer questions, but *acts* on it to get arbitrary
tasks done. Includes four browser-use demos.

🔗 **Live site:** http://michaelzhang.xyz/ff-demos-susan/
(also at https://mzio.github.io/ff-demos-susan/)

## What's here

- `index.html` — the single-page post (no build step, no framework)
- `style.css` — mobile-first, blog-post styling
- `assets/videos/` — web-optimized MP4 demo recordings
- `assets/posters/` — poster frames for each video
- `encode.sh` — the ffmpeg script used to compress the source `.mov` files

## The demos

1. **Booking a reservation** — books a table for four, end to end.
2. **Exploring businesses on Instagram** — open-ended discovery of local businesses.
3. **Sending recommendations to family & friends** — carries context from
   exploration into a shared message.
4. **Messaging a business with a question** — reaches out directly when the
   answer isn't on the internet.

## Local preview

It's a static site — just open `index.html`, or serve the folder:

```sh
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Re-encoding videos

Source recordings live in the main `flawed-flowed` repo under
`assets/demo_susan/*.mov`. To regenerate the web-optimized versions:

```sh
./encode.sh
```

The script scales each recording to 1440px wide, caps at 30fps, and encodes
H.264 (CRF 28) with `+faststart` for progressive streaming.
