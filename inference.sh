#!/bin/bash

# Default value for super-resolution
SUPERRES_METHOD="none"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --superres)
            SUPERRES_METHOD="$2"
            shift ;;
        *) 
            
            ;;
    esac
    shift
done

python -m scripts.inference \
    --unet_config_path "configs/unet/second_stage.yaml" \
    --inference_ckpt_path "checkpoints/latentsync_unet.pt" \
    --inference_steps 20 \
    --guidance_scale 1.5 \
    --video_path "assets/input_video_with_audio.mp4" \
    --audio_path "assets/input_audio.wav" \
    --video_out_path "video_out.mp4" \
    --superres "${SUPERRES_METHOD}"
