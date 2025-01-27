#!/usr/bin/env bash
set -euo pipefail

readonly CURSOR_APP="/Applications/Cursor.app"
readonly CURSOR_PLIST="${CURSOR_APP}/Contents/Info.plist"
readonly CURSOR_PLIST_BACKUP="${CURSOR_PLIST}.backup"

# Check if running on macOS
if [[ "${OSTYPE}" != "darwin"* ]]; then
    printf "Error: This script only supports macOS\\n" >&2
    exit 1
fi

# Check for root privileges
if [[ "${EUID}" -ne 0 ]]; then
    printf "Please run with sudo\\n" >&2
    exit 1
fi

# Check if Cursor.app exists
if [[ ! -d "${CURSOR_APP}" ]]; then
    printf "Error: Cursor.app not found in /Applications\\n" >&2
    printf "Please install Cursor IDE first\\n" >&2
    exit 1
fi

# Check if required commands exist
for cmd in PlistBuddy killall; do
    if ! command -v "${cmd}" >/dev/null 2>&1; then
        printf "Error: Required command '%s' not found\\n" "${cmd}" >&2
        exit 1
    fi
done

printf "Setting up Cursor IDE drop-target...\\n"

if [[ -f "${CURSOR_PLIST}" ]]; then
    cp "${CURSOR_PLIST}" "${CURSOR_PLIST_BACKUP}"
fi

# Define PlistBuddy commands
readonly PLIST_COMMANDS=(
    "Add :CFBundleDocumentTypes array"
    "Add :CFBundleDocumentTypes:0 dict"
    "Add :CFBundleDocumentTypes:0:CFBundleTypeRole string Editor"
    "Add :CFBundleDocumentTypes:0:LSItemContentTypes array"
    "Add :CFBundleDocumentTypes:0:LSItemContentTypes:0 string public.folder"
)

# Add folder handling capabilities to Cursor.app
# Each command is allowed to fail as the keys might already exist
for cmd in "${PLIST_COMMANDS[@]}"; do
    /usr/libexec/PlistBuddy -c "${cmd}" "${CURSOR_PLIST}" 2>/dev/null || true
done

touch "${CURSOR_APP}"
killall Finder Dock

printf "\033[1mDone!\033[0m \033[90mYou might need to close all Cursor instances or log out and back in to macOS for changes to take effect.\033[0m\\n"