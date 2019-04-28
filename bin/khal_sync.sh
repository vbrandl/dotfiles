#!/usr/bin/env sh
notify_khal() {
	while inotifywait -r -e modify -e create -e delete "${HOME}/.calendars/"; do
		"${HOME}/bin/vdirsyncer.sh"
	done
}
notify_khal &
