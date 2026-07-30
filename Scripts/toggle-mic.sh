#!/bin/bash

# Define the names
SINK_NAME="audiorelay-virtual-mic-sink"
SOURCE_NAME="Virtual-Mic"

# Check if the module is already loaded
if pactl list modules | grep -q "$SINK_NAME"; then
    echo "Turning OFF Phone Mic..."
    # Unload by the name we gave it
    pactl unload-module module-remap-source
    pactl unload-module module-null-sink
    echo "Virtual devices removed."
else
    echo "Turning ON Phone Mic..."
    # 1. Create the Sink (The "Speaker" end)
    pactl load-module module-null-sink \
        sink_name=$SINK_NAME \
        sink_properties=device.description="Phone-Audio-Sink"

    # 2. Create the Source (The "Microphone" end for Discord)
    pactl load-module module-remap-source \
        master=$SINK_NAME.monitor \
        source_name=$SOURCE_NAME \
        source_properties=device.description="Phone-Microphone"

    echo "Virtual devices created! Connect AudioRelay now."
fi
