#!/usr/bin/with-contenv bashio

DECO_HOST=$(bashio::config 'deco_host')
DECO_PASS=$(bashio::config 'deco_pass')
AGH_HOST=$(bashio::config 'agh_host')
AGH_USER=$(bashio::config 'agh_user')
AGH_PASS=$(bashio::config 'agh_pass')
MIN_IP=$(bashio::config 'min_ip_suffix')
RUN_ON_START=$(bashio::config 'run_on_start')

run_sync() {
    bashio::log.info "Iniciando sincronizacion Deco -> AdGuard Home..."
    python3 /app/deco_to_adguard.py \
        --deco-host  "$DECO_HOST" \
        --deco-pass  "$DECO_PASS" \
        --agh-host   "$AGH_HOST" \
        --agh-user   "$AGH_USER" \
        --agh-pass   "$AGH_PASS" \
        --min-ip     "$MIN_IP" \
        --output     /tmp/clientes_adguard.yaml
    bashio::log.info "Sincronizacion completada."
}

# Correr al inicio si está habilitado
if bashio::var.true "$RUN_ON_START"; then
    run_sync
fi

# Loop: correr cada 6 horas
bashio::log.info "Programando sync cada 6 horas..."
while true; do
    sleep 21600
    run_sync
done
