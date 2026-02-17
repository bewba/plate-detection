FROM rocm/pytorch:latest

# 1. Hardware & Environment Config
ENV HSA_OVERRIDE_GFX_VERSION=10.3.0
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# 2. Install System Dependencies (Mesa/GL/OpenCV support)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglx-mesa0 \
    libglib2.0-0 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 3. THE CACHE TRICK: Copy ONLY requirements first
COPY requirements.txt /app/requirements.txt

# 4. Install Python Dependencies 
# Docker will CACHE this layer. As long as requirements.txt doesn't change, 
# this step will take 0 seconds in future builds.
RUN pip install --no-cache-dir -r requirements.txt

# 5. Finally, copy the rest of your project code
# Because this is at the end, changing your code won't trigger the pip install above.
COPY . /app