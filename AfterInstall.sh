#!/bin/bash
ls -lrta /var/www/html/dist/
sudo systemctl start nginx
sudo systemctl status nginx
