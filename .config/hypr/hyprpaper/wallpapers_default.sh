# Configuration
WALLPAPER_DIR="$HOME/.config/hypr/hyprpaper/wallpapers/jp3.jpg" # Your wallpaper directory
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Function to update hyprpaper config
update_config() {
  local wallpaper="${WALLPAPER_DIR}"
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
