#!/bin/bash
# Compress demo .mov screen recordings into web-optimized MP4 + poster frames.
set -euo pipefail
export PATH="/opt/homebrew/bin:$PATH"

SRC="/Users/michael/Documents/projects/flawed-flowed/assets/demo_susan"
OUT="/Users/michael/Documents/projects/flawed-flowed-demos/assets"

# map: source_basename -> output_slug
declare -a PAIRS=(
  "demo_instagram_bookres:book-reservation"
  "demo_instagram_explore:explore-businesses"
  "demo_instagram_email_sz10:send-recommendations"
  "demo_instagram_dm_business:message-business"
)

for pair in "${PAIRS[@]}"; do
  src="${pair%%:*}"
  slug="${pair##*:}"
  in="$SRC/$src.mov"
  mp4="$OUT/videos/$slug.mp4"
  poster="$OUT/posters/$slug.jpg"
  echo ">>> encoding $src -> $slug"
  ffmpeg -y -i "$in" \
    -vf "scale=1440:-2,fps=30" \
    -c:v libx264 -profile:v high -crf 28 -preset slow \
    -pix_fmt yuv420p -movflags +faststart \
    -c:a aac -b:a 96k \
    "$mp4"
  echo ">>> poster for $slug"
  ffmpeg -y -ss 3 -i "$in" -vf "scale=1440:-2" -frames:v 1 -q:v 4 "$poster"
  echo ">>> done $slug: $(du -h "$mp4" | cut -f1)"
done
echo "ALL DONE"
ls -lh "$OUT/videos" "$OUT/posters"
