FROM rocm/pytorch:latest

# Set environment variables for the RX 6600 XT (Navi 23 / gfx1032)
# Overriding to 10.3.0 is correct for RDNA2 compatibility.
ENV HSA_OVERRIDE_GFX_VERSION=10.3.0
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install system dependencies
# Added libgl1 and libglx-mesa0 to ensure the GL stack is complete
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglx-mesa0 \
    libglib2.0-0 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the project files
COPY . /app

# Install Python dependencies
# We use --extra-index-url just in case, though the base image usually has torch.
RUN pip install --no-cache-dir \
    ultralytics \
    easyocr \
    opencv-python-headless