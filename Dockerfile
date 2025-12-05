# ---------------------------------------
# Dockerfile สำหรับ Longan Map (Static HTML + JS)
# ---------------------------------------

# Base image ใช้ nginx แบบ lightweight
FROM nginx:alpine

# ลบ content เริ่มต้นของ nginx
RUN rm -rf /usr/share/nginx/html/*

# คัดลอกไฟล์โปรเจกต์ทั้งหมดลงใน nginx html directory
COPY . /usr/share/nginx/html

# กำหนดสิทธิ์ให้ไฟล์สามารถอ่านได้
RUN chmod -R 755 /usr/share/nginx/html

# expose port 80
EXPOSE 80

# สั่งให้ nginx run แบบ foreground
CMD ["nginx", "-g", "daemon off;"]
