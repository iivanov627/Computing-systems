#!/bin/bash

for i in $(seq 1 50); do

    biomass=$((450 - i))
    protein=$((45 + i))

    power=$(awk -v i="$i" 'BEGIN {
        printf "%.1f", 5 + i * 0.1
    }')

    payload=$(printf \
        '{"biomass_kg":%d,"protein_ready":%d,"power_kw":%s}' \
        "$biomass" "$protein" "$power")

    mosquitto_pub \
        -h localhost \
        -p 1883 \
        -t "venus/kitchen/telemetry" \
        -m "$payload"

    echo "[$i/50] $payload"

    sleep 0.1
done

echo "Готово! Отправлено 50 сообщений."