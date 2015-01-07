rm .zeus.sock
killall -9 redis-server
killall -9 zeus-linux-386
killall -9 ruby
killall -9 inotify-wrapper
foreman start -f Procfile.dev