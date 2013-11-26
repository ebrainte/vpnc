
#!/bin/bash
pid=/var/run/vpnc/pid
PID="$(cat "$pid" 2> /dev/null)"
if [ -z "$PID" ]; then
/root/vpn.sh
logger hubo que reconectar la VPN
else
logger conectado
fi
