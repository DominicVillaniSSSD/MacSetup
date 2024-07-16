#!/bin/bash

source app_locations.sh

remove_all_apps_from_dock() {
    echo "Removing all apps from the Dock for user $target_user..."

    # Clear the persistent-apps array for the target user
    sudo -u "$target_user" defaults write com.apple.dock persistent-apps -array

    echo "All apps have been removed from the Dock for user $target_user."
}

list_dock_apps() {
    sudo -u "$target_user" defaults read com.apple.dock persistent-apps | grep _CFURLString\" | cut -d '"' -f 4
}

add_app_to_dock() {
    app_path="$1"
    # Check if app is installed
    if [ ! -d "$app_path" ]; then
        echo "$app_path is not installed."
        exit 1
    fi

    # Add app to the Dock for the target user
    echo "Adding $app_path to the Dock for user $target_user..."
    sudo -u "$target_user" defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>'"$app_path"'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
}

restart_dock() {
    echo "Restarting the Dock to apply changes for user $target_user..."
    sudo -u "$target_user" killall Dock
}

setup_doc_substitute() {

    remove_all_apps_from_dock

    add_app_to_dock "$launchpad_path"
    add_app_to_dock "$chrome_path"
    add_app_to_dock "$calendar_path"
    add_app_to_dock "$excel_path"
    add_app_to_dock "$powerpoint_path"
    add_app_to_dock "$word_path"
    add_app_to_dock "$visualizer_path"
    add_app_to_dock "$zoom_path"
    add_app_to_dock "$appstore_path"
    add_app_to_dock "$settings_path"

    restart_dock
}

setup_doc_sitetech() {

    remove_all_apps_from_dock

    add_app_to_dock "$launchpad_path"
    add_app_to_dock "$chrome_path"
    add_app_to_dock "$calendar_path"
    add_app_to_dock "$excel_path"
    add_app_to_dock "$powerpoint_path"
    add_app_to_dock "$word_path"
    add_app_to_dock "$visualizer_path"
    add_app_to_dock "$zoom_path"
    add_app_to_dock "$appstore_path"
    add_app_to_dock "$settings_path"

    restart_dock
}

setup_doc_admin() {

    remove_all_apps_from_dock

    add_app_to_dock "$launchpad_path"
    add_app_to_dock "$chrome_path"
    add_app_to_dock "$calendar_path"
    add_app_to_dock "$excel_path"
    add_app_to_dock "$powerpoint_path"
    add_app_to_dock "$word_path"
    add_app_to_dock "$visualizer_path"
    add_app_to_dock "$zoom_path"
    add_app_to_dock "$appstore_path"
    add_app_to_dock "$settings_path"

    restart_dock
}

setup_doc() {

    remove_all_apps_from_dock

    add_app_to_dock "$launchpad_path"
    add_app_to_dock "$chrome_path"
    add_app_to_dock "$calendar_path"
    add_app_to_dock "$excel_path"
    add_app_to_dock "$powerpoint_path"
    add_app_to_dock "$word_path"
    add_app_to_dock "$visualizer_path"
    add_app_to_dock "$zoom_path"
    add_app_to_dock "$appstore_path"
    add_app_to_dock "$settings_path"

    restart_dock

    #How to use
    # read -p "Enter the target username: " target_user
    # setup_doc
}

# setup_doc_admin
# setup_doc_sitetech
# setup_doc_substitute


echo "done"