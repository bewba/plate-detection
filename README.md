# Licence-Plate-Detection-and-Recognition-using-YOLO-V8-EasyOCR

Since you already have the Dockerfile and docker-compose.yml ready, fire up the environment.

```bash
docker compose up -d --build
```
then verify using
```bash
docker compose exec lpr-app python3 test.py
```

Expected Output:

    `ROCm/GPU Available: True`

    `Device Name: AMD Radeon RX 6600 XT`


If new requirements or libraries are added, update the requirements.txt file and run the following command:
```bash
docker compose up -d --build
```
