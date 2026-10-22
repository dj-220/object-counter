# Run the Object Counter locally without Docker (dev mode, no auth).
# Setup once:  python -m venv .venv ; .\.venv\Scripts\pip install fastapi "uvicorn[standard]" python-multipart "opencv-python-headless<5" numpy apscheduler timm safetensors torch torchvision --extra-index-url https://download.pytorch.org/whl/cpu
$env:DEV_MODE = "1"
$env:STORAGE_DIR = "$PSScriptRoot\data\uploads"
$env:DINO_WEIGHTS = "$PSScriptRoot\weights\dinov2_vits14.safetensors"
$env:TORCH_THREADS = "4"
$env:MAX_UPLOAD_MB = "15"
Set-Location $PSScriptRoot
.\.venv\Scripts\python.exe -m uvicorn app.main:app --host 127.0.0.1 --port 8090
