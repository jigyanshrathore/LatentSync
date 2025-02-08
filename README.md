Changes in inference.py

Original Functionality:

The script processed video frames using the LatentSync model.

It did not consider the quality difference between the generated subframes and the input frame.

No super-resolution was applied to improve degraded generated parts.

Enhancements:

Added Super-Resolution Support

Introduced a --superres command-line argument to allow users to select GFPGAN, CodeFormer, or none.

Implemented a function to apply super-resolution selectively on the generated subframe only if it has lower resolution than the original frame.

Resolution Check

The script now determines the resolution ratio between the input frame and the generated subframe.

If the generated subframe is of lower resolution, the selected super-resolution model is applied.

Integration of GFPGAN & CodeFormer

GFPGAN and CodeFormer were integrated to upscale the generated subframe.

The correct model is selected based on the user-specified --superres flag.

Performance Optimization

The script ensures that only necessary regions of the frame are enhanced, avoiding unnecessary computations.

New Usage Command for inference.py

python inference.py --superres GFPGAN
python inference.py --superres CodeFormer
python inference.py --superres none  # Runs without super-resolution

Changes in inference.sh

Original Functionality:

Created and activated a Conda environment.

Installed necessary dependencies.

Downloaded required model checkpoints.

No support for super-resolution was available.

Enhancements:

Added --superres Parameter

Modified the script to accept a --superres argument and pass it to inference.py.

Updated Dependency Installation

Ensured that GFPGAN and CodeFormer dependencies are installed.

Installed OpenCV dependencies correctly on different platforms.

Improved Environment Setup

Ensured that Conda environments are correctly initialized before activation.

Allowed better error handling for package installation.

New Usage Command for inference.sh

bash inference.sh --superres GFPGAN
bash inference.sh --superres CodeFormer
bash inference.sh --superres none  # Runs without super-resolution

Final Notes

The changes enhance video quality by improving generated subframes selectively.

Super-resolution is applied only if needed, ensuring efficiency.

The script is now more modular, allowing easy switching between super-resolution methods.

For any issues, ensure that dependencies are installed and that all model checkpoints are correctly downloaded before running inference.

