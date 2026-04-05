# Configuration
WALLPAPER_DIR="$HOME/.config/hypr/hyprpaper/wallpapers" # Your wallpaper directory
INTERVAL=60
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Function to get a random wallpaper from the directory
get_random_wallpaper() {
  find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1
}

# Function to update hyprpaper config
update_config() {
  local wallpaper="$1"

  # Create new config content
  cat >"$CONFIG_FILE" <<EOF
preload = $wallpaper
wallpaper = LVDS-1,$wallpaper
wallpaper = HDMI-A-1,$wallpaper
splash = true
EOF

  # Reload hyprpaper
  pkill hyprpaper
  hyprpaper &
}

update_config "$(get_random_wallpaper)"
