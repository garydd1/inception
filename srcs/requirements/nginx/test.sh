#!/bin/bash

# Get container IDs
container_ids=(
    78a1397ecf02
    e39c8af2ac3d
    c2f514c4e405
    da81bbfcfb9c
    d1316b2ea64d
    2b09cedf8088
    22f711eca3be
    33f11553e7fd
)

# Iterate over each container
for container_id in "${container_ids[@]}"; do
    # Get container size
    size=$(sudo docker inspect "$container_id" --format='{{.Size}}')
    
    # Display container ID and size
    echo "Container ID: $container_id, Size: $size"
done
