payload=$(printf \
        '{"biomass_kg":%d,"protein_ready":%d,"power_kw":%s}' \
        30 20 3)

mosquitto_pub -h localhost -p 1883 -t "venus/kitchen/telemetry" -m "$payload"